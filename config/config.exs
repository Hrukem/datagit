# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :datagit,
  ecto_repos: [Datagit.Repo]

# Configures the endpoint
config :datagit, DatagitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Rc63JHWJLXvQ4MXvPvoGxxb+hcxKIxQ1lV6nh4wmBllpkuhK2++UUSVf/0EDpA51",
  render_errors: [view: DatagitWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Datagit.PubSub,
  live_view: [signing_salt: "6htAta/v"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
