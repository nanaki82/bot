defmodule Db.Teams do
  use Ecto.Schema
  @primary_key {:name, :string, autogenerate: false}

  schema "teams" do
    field(:external_id, Ecto.UUID)
    has_many(:hunters, Db.Hunters, foreign_key: :team_id)
    has_one(:captain, Db.Hunters, foreign_key: :id)
  end
end
