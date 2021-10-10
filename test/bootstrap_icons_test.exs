defmodule BootstrapIconsTest do
  use ExUnit.Case, async: true

  test "generated function" do
    alarm =
      :code.priv_dir(:bootstrap_icons)
      |> Path.join("bootstrap/alarm.svg")
      |> File.read!()

    assert Bootstrap.Icons.alarm()
           |> Phoenix.HTML.safe_to_string() ==
             alarm

    assert Bootstrap.Icons.alarm(class: "text-danger fs-2")
           |> Phoenix.HTML.safe_to_string() =~
             ~s(class="bi bi-alarm text-danger fs-2")

    assert Bootstrap.Icons.alarm(class: "<> \" ")
           |> Phoenix.HTML.safe_to_string() =~
             ~s(class="bi bi-alarm &lt;&gt; &quot;")

    assert Bootstrap.Icons.alarm(foo: "bar")
           |> Phoenix.HTML.safe_to_string() =~
             ~s(foo="bar")

    assert Bootstrap.Icons.alarm(multiword_key: "foo")
           |> Phoenix.HTML.safe_to_string() =~
             ~s(multiword-key="foo")

    assert Bootstrap.Icons.alarm(viewBox: "0 0 12 12")
           |> Phoenix.HTML.safe_to_string() =~
             ~s(viewBox=\"0 0 12 12\")

    refute Bootstrap.Icons.alarm(viewBox: "0 0 12 12")
           |> Phoenix.HTML.safe_to_string() =~
             ~s(viewBox=\"0 0 24 24\")
  end

  test "generated docs" do
    {:docs_v1, _annotation, _beam_language, _format, _module_doc, _metadata, docs} =
      Code.fetch_docs(Bootstrap.Icons)

    doc =
      Enum.find_value(docs, fn
        {{:function, :alarm, 1}, _annotation, _signature, doc, _metadata} -> doc
        _ -> nil
      end)

    assert doc["en"] == """
           ![](assets/bootstrap/alarm.svg) {: width=24px}

           ## Examples
               iex> alarm()
               iex> alarm(class: "text-danger fs-2")
           """
  end
end
