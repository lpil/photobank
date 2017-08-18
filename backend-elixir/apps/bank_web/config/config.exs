# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bank_web,
  namespace: BankWeb,
  ecto_repos: [Bank.Repo]

# Configures the endpoint
config :bank_web, BankWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "05TEI+HS+FaXXQv9aE6jY/+TvEMcN1SM7DiggMeCu71EvY3CuOWK7db/KP1paj45",
  render_errors: [view: BankWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BankWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :bank_web, :generators,
  context_app: :bank

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
