defmodule Iphod.MixProject do
  use Mix.Project

  def project do
    [
      app: :iphod,
      version: "0.1.0",
      elixir: "~> 1.7.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Iphod.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :edeliver
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0-rc", overrid: true},
      {:phoenix_pubsub, "~> 1.1"},
      {:ecto_sql, "~> 3.0-rc"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2-rc", only: :dev},
      {:postgrex, ">= 0.13.3"},
      {:gettext, "~> 0.11"},
      {:html_entities, "~> 0.4"},
      {:jason, "~> 1.0"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:cowboy, "~> 2.5"},
      {:timex, "~> 3.2.1"},
      {:poison, "~> 2.1", override: true},
      # {:jason, "~> 1.0"},
      {:httpoison, "~> 0.11.0"},
      {:mailgun, "~> 0.1.2"},
      {:earmark, "~> 1.3.0"},
      {:dogma, "~> 0.1", only: :dev},
      {:comeonin, "~> 3.0"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:edeliver, "~> 1.6.0"},
      {:distillery, "~> 2.0.12", warn_missing: false},
      {:exactor, "~> 2.2.4"},
      {:conform, "~> 2.5.2"},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
