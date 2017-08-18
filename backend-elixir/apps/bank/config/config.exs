use Mix.Config

config :bank, ecto_repos: [Bank.Repo]

import_config "#{Mix.env}.exs"
