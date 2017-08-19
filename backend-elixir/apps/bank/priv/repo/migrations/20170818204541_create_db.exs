defmodule Bank.Repo.Migrations.CreateDb do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :text, :string, null: false
      timestamps()
    end
  end
end
