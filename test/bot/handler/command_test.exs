defmodule Bot.Handler.CommandTest do
  use ExUnit.Case, async: true

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Db.Repo)
  end

  test "start command call register one" do
    assert {:error, "The team doesn't exist"} =
             Bot.Handler.Command.handle(:start, 1, "test", [UUID.uuid4()])
  end

  test "team doesn't exist" do
    assert {:error, "The team doesn't exist"} =
             Bot.Handler.Command.handle(:register, 1, "test", UUID.uuid4())
  end

  test "hunter already exists" do
    team_name = "test team"
    team_code = UUID.uuid4()
    huner_id = 42
    hunter_name = "Test Name"

    %Db.Teams{
      name: team_name,
      external_id: team_code
    }
    |> Db.Repo.insert()

    %Db.Hunters{
      id: huner_id,
      name: hunter_name,
      team_id: team_name
    }
    |> Db.Repo.insert()

    assert {:error, "The hunter is already registered: " <> hunter_name} =
             Bot.Handler.Command.handle(:register, huner_id, hunter_name, team_code)
  end

  test "insert hunter in a team" do
    team_name = "test team"
    team_code = UUID.uuid4()

    %Db.Teams{
      name: team_name,
      external_id: team_code
    }
    |> Db.Repo.insert()

    assert :ok = Bot.Handler.Command.handle(:register, 42, "name", team_code)
  end

  test "unsupported command" do
    assert {:error, "Unsupported command"} =
             Bot.Handler.Command.handle(:unsupported_command, 99, "", "")
  end
end
