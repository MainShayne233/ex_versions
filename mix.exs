defmodule ExVersions.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_versions,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A module that updates your README.md with version numbers for specified dependencies",
     package: package,
     deps: deps()]
  end

  def package do
    [
      maintainers: ["Shayne Tremblay"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/MainShayne233/ex_versions"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end
end
