defmodule Drip.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :drip,
      version: @version,
      elixir: "~> 1.13",
      consolidate_protocols: Mix.env() != :test,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "Drip",
      source_url: "https://github.com/CrazyEggInc/drip",
      homepage_url: "https://github.com/CrazyEggInc/drip",
      description: """
      Drip API client for Elixir applications
      """,
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # Required
      {:tesla, "~> 1.5"},
      {:hackney, "~> 1.17"},
      {:jason, "~> 1.4"},

      # Dev deps
      {:credo, "~> 1.6", only: :dev, runtime: false},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["CrazyEgg <open-source@crazyegg.com>"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/CrazyEggInc/drip"
      }
    ]
  end

  defp docs do
    [
      authors: [
        "Filip Vavera <filip@crazyegg.com>"
      ],
      main: "overview",
      formatters: ["html"],
      extra_section: "Guides",
      extras: extras()
    ]
  end

  defp extras do
    [
      # Introduction
      "docs/introduction/overview.md",
      "docs/introduction/installation.md"
    ]
  end
end
