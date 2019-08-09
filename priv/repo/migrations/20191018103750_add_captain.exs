defmodule Db.Repo.Migrations.AddCaptain do
  use Ecto.Migration

  def change do
    alter table("teams") do
      add :captain_id, references(:hunters)
    end
  end
end
