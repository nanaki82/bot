defmodule Db.Hunters do
  use Ecto.Schema
  @primary_key {:id, :integer, autogenerate: false}

  schema "hunters" do
    field(:name, :string)
    belongs_to(:team, Db.Teams, references: :name, type: :string)
  end
end
