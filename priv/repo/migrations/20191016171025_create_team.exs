defmodule Hunter.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :name, :string, primary_key: true
      add :external_id, :uuid, null: false
    end
  end
end
