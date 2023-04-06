use Mix.Config

# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.

#import Config

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
config :moab, ecto_repos: [Moab.Repo]

config :moab, Moab.Repo,
  hostname: "localhost",
  username: "producer",
  password: "D1ckne$$",
  database: "product_universe",
  port: "5430"
  #show_sensitive_data_on_connection_error: true

config :logger,
  handle_sasl_reports: true,
  backends: [:console],
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]

