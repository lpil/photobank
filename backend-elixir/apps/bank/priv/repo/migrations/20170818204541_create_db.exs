defmodule Bank.Repo.Migrations.CreateDb do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :text, :string, null: false
      timestamps()
    end
  end
end
