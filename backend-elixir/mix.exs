defmodule Bank.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end


  defp deps do
    [
      # Automatic test runner
      {:mix_test_watch, "~> 0.4", [only: :dev, runtime: false]},
    ]
  end


  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run apps/bank/priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
    ]
  end
end
