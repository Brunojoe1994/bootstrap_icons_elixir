defmodule Bootstrap.Icons do
  @moduledoc """
  Outline style icons drawn with a stroke.

  For primary navigation and marketing sections, designed to be rendered at 24x24.
  """
  @icon_dir "bootstrap/"
  @default_attrs [
    xmlns: "http://www.w3.org/2000/svg",
    width: 16,
    height: 16,
    fill: "currentColor",
    class: "",
    viewBox: "0 0 16 16"
  ]
  @before_compile Bootstrap
end
