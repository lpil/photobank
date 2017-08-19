defmodule Bank.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp deps do
    [
      # Automatic test runner
      {:mix_test_watch, "~> 0.4", [only: :dev, runtime: false]},
    ]
  end
end
