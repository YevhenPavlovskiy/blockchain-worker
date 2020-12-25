defmodule BlockchainWorker.MixProject do
  use Mix.Project

  def project do
    [
      app: :blockchain_worker,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BlockchainWorker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0"},
      {:httpotion, "~> 3.1.0"}
    ]
  end
  
  defp escript do
    [main_module: BlockchainWorker]
  end
end