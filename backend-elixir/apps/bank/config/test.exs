use Mix.Config

# Configure your database
config :bank, Bank.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bank_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
