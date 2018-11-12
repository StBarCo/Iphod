# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :iphod,
  ecto_repos: [Iphod.Repo]

# Configures the endpoint
config :iphod, IphodWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Jw4FteE99bN+/mL6tFEIPG715Asimlq9eW178p5gD6IG81R7fpVxA9VAOUZ43gCK",
  render_errors: [view: IphodWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Iphod.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

if Mix.env() == :dev do
  config :mix_test_watch,
    clear: true,
    tasks: ~w(test dogma)
end

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :iphod, IphodWeb.Gettext, default_locale: "en"
