defmodule ProductManagment.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      elixir: "~> 1.10",
      app: :moab,
      escript: escript_config(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Moab.Server, []},
      applications: [:con_cache],
      extra_applications: [:logger],
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.

  # moebius is here to help with db access
  defp deps do
    [
     #{:typed_struct, "~> 0.1.4"},
     {:ecto_sql, "~> 3.6.1"},
     {:postgrex, ">= 0.15.0"},
     {:con_cache, "~> 0.13"}
     #{:products, in_umbrella: true},
     #{:competitions, in_umbrella: true},
     #{:milestones, in_umbrella: true},
     #{:feature_dependencies, in_umbrella: true},
     #{:features, in_umbrella: true},
     #{:feature_requestors, in_umbrella: true},
     #{:feature_team_dependencies, in_umbrella: true},
    ]
  end

  defp escript_config() do
    [
      main_module: Moab.Main
    ]
  end
end
