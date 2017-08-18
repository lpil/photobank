defmodule Bank.Application do
  @moduledoc """
  The Bank Application Service.

  The bank system business domain lives in this application.

  Exposes API to clients such as the `BankWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Bank.Repo, []),
    ], strategy: :one_for_one, name: Bank.Supervisor)
  end
end
