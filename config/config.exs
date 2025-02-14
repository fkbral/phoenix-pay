# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixpay,
  ecto_repos: [Phoenixpay.Repo]

# Configures the endpoint
config :phoenixpay, PhoenixpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kDEl8VozeSn6TZOrnQK25eWm8gq7OIuKK5dDcpz7skk4Z3vILe13bbOGNbKByT93",
  render_errors: [view: PhoenixpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Phoenixpay.PubSub,
  live_view: [signing_salt: "r9e0qH7+"]

config :phoenixpay, Phoenixpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :phoenixpay, :basic_auth,
  username: "admin",
  password: "123456"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
