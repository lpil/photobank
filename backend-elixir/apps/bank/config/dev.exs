use Mix.Config

# Configure your database
config :bank, Bank.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bank_dev",
  hostname: "localhost",
  pool_size: 10
