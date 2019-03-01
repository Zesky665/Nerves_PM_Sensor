# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sensor,
  ecto_repos: [Sensor.Repo]

# Configures the endpoint
config :sensor, SensorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lHqzBknG6xaYUTQuy+V/lCSPAs8/dV8XrJwzXN8nkfZP24GdutXBqdEAto9cO0Vi",
  render_errors: [view: SensorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sensor.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
