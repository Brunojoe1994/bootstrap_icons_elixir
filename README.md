# Bootstrap Icons

<!-- MDOC !-->

[![Module Version](https://img.shields.io/hexpm/v/bootstrap_icons_elixir.svg)](https://hex.pm/packages/bootstrap_icons_elixir)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/bootstrap_icons_elixir/)
[![Total Download](https://img.shields.io/hexpm/dt/bootstrap_icons_elixir.svg)](https://hex.pm/packages/bootstrap_icons_elixir)
[![License](https://img.shields.io/hexpm/l/bootstrap_icons_elixir.svg)](https://github.com/oliverandrich/bootstrap_icons_elixir/blob/master/LICENSE.txt)
[![Last Updated](https://img.shields.io/github/last-commit/oliverandrich/bootstrap_icons_elixir.svg)](https://github.com/oliverandrich/bootstrap_icons_elixir/commits/master)

[Bootstrap Icons](https://icons.getbootstrap.com) is a "free, high quality, open source icon library with over 1,300 icons". This package gives you Elixir functions to drop Bootstrap Icons into your HTML, styled with arbitrary classes.

Bootstrap Icons are designed by [Bootstrap Team](https://twitter.com/getbootstrap)

## Installation

Add Bootstrap Icons to your `mix.exs`:

```elixir
defp deps do
  [
    {:bootstrap_icons, "~> 0.1.0"}
  ]
end
```

After that, run `mix deps.get`.

## Usage

The icons are in `BootstrapIcons`. You can get an icon by name

```eex
<%= Bootstrap.Icons.alarm() %>
```

and style it with some classes

```eex
<%= Bootstrap.Icons.alarm(class: "text-danger", width: 32, height: 32) %>
```

Note these functions return `Phoenix.HTML.Safe` iodata:

```elixir
iex(1)> Bootstrap.Icons.alarm()
{:safe,
 ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\"", #...

iex(2)> Bootstrap.Icons.alarm() |> Phoenix.HTML.safe_to_string
"<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 20 20\" fill=\"currentColor\">\n  ..."
```

For a full list of icons see [the docs](https://icons.getbootstrap.com/#icons) or [icons.getbootstrap.com](https://icons.getbootstrap.com/).

## Credits

This project is heavily based on the fantastic [heroicons_elixir](https://github.com/mveytsman/heroicons_elixir) package by [Max Veytsman](https://github.com/mveytsman). I just replaced the Heroicons with the Bootstrap icons and patched some parts to support the specialities of the Bootstrap SVG icons.
