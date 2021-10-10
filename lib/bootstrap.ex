defmodule Bootstrap do
  @moduledoc """
  This library provides functions for every [Bootstrap Icons](https://icons.getbootstrap.com).
  See `Bootstrap.Icons` for the icons.

  Bootstrap Icons are designed by [Bootstrap Team](https://twitter.com/getbootstrap)
  """

  @doc false
  defmacro __before_compile__(%Macro.Env{module: module}) do
    unless Module.has_attribute?(module, :icon_dir) do
      raise CompileError, description: "@icon_dir attribute is required"
    end

    icon_dir = Module.get_attribute(module, :icon_dir)
    default_attrs = Module.get_attribute(module, :default_attrs)

    icon_paths =
      Path.absname(icon_dir, :code.priv_dir(:bootstrap_icons))
      |> Path.join("*.svg")
      |> Path.wildcard()

    for path <- icon_paths do
      generate_function(path, default_attrs)
    end
  end

  @doc false
  def generate_function(path, default_attrs) do
    name =
      Path.basename(path, ".svg")
      |> String.replace("-", "_")
      |> String.to_atom()

    icon = File.read!(path)
    {i, _} = :binary.match(icon, ">")
    {_, body} = String.split_at(icon, i)

    default_class = "bi bi-#{name}" |> String.replace("_", "-")

    doc = """
    ![](assets/#{Path.relative_to(path, :code.priv_dir(:bootstrap_icons))}) {: width=24px}

    ## Examples
        iex> #{name}()
        iex> #{name}(class: "text-danger fs-2")
    """

    quote do
      @doc unquote(doc)
      @spec unquote(name)(keyword(binary)) :: binary
      def unquote(name)(opts \\ []) do
        opts =
          Keyword.merge(unquote(default_attrs), opts)
          |> Keyword.update(
            :class,
            unquote(default_class),
            fn v -> Enum.join([unquote(default_class), v], " ") |> String.trim() end
          )

        attrs =
          for {k, v} <- opts do
            safe_k =
              k |> Atom.to_string() |> String.replace("_", "-") |> Phoenix.HTML.Safe.to_iodata()

            safe_v = v |> Phoenix.HTML.Safe.to_iodata()

            {:safe, [?\s, safe_k, ?=, ?", safe_v, ?"]}
          end

        {:safe, ["<svg", Phoenix.HTML.Safe.to_iodata(attrs), unquote(body)]}
      end
    end
  end
end
