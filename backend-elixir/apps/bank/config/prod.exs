use Mix.Config

config :bank, Bank.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bank_prod",
  pool_size: 15
