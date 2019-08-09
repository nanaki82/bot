defmodule Bot.MixProject do
  use Mix.Project

  def project do
    [
      app: :bot,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      consolidate_protocols: Mix.env() != :dev,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/lib", "test/stub"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger],
      mod: {Bot.Application, []}
    ]
  end

  defp deps do
    [
      {:mappable, "~> 0.2.4"},
      {:tzdata, "~> 1.0"},
      {:nadia, "~> 0.5.0"},
      {:plug_cowboy, "~> 2.1"},
      {:jason, "~> 1.1"},
      {:remix, "~> 0.0.2", only: :dev},
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15.1"},
      {:eqrcode, "~> 0.1.6"},
      {:uuid, "~> 1.1"},
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.12.0", only: :test},
      {:hackney, github: "benoitc/hackney", override: true},
      {:mox, "~> 0.5", only: :test}
    ]
  end
end
