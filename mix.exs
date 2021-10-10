defmodule BootstrapIconsElixir.MixProject do
  use Mix.Project

  @repo_url "https://github.com/oliverandrich/bootstrap_icons_elixir"
  @version "0.1.3"

  def project do
    [
      app: :bootstrap_icons,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      name: "Bootstrap Icons",
      source_url: @repo_url,
      homepage_url: @repo_url,
      description: description(),
      docs: [
        main: "Bootstrap",
        api_reference: false,
        source_ref: @version,
        extras: ["README.md"],
        extra_section: [],
        assets: "priv/"
      ]
    ]
  end

  defp description do
    """
    Include Bootstrap icons as SVG-strings in your Elixir/Phoenix project!,
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_html, "~> 2.14 or ~> 3.0"},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: :bootstrap_icons,
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Oliver Andrich, oliver@andrich.me"],
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url}
    ]
  end
end
