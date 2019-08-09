defmodule Hunter.Repo.Migrations.CreateHunter do
  use Ecto.Migration

  def change do
    create table(:hunters) do
      add :name, :string
      add :team_id, references(:teams, column: :name, type: :string)
    end
  end
end
