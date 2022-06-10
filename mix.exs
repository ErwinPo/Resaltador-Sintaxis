defmodule Resaltador.MixProject do
  use Mix.Project

  def project do
    [
      app: :resaltador,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()

    ]
  end

  def escript do
    [main_module: Resaltador]
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
      {:benchee, "~> 1.1.0", only: :dev},
      {:html_entities, "~> 0.5"},
    ]
  end

end
