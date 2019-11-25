defmodule Mix.Tasks.TeamTest do
    use ExUnit.Case, async: true

    setup do
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Db.Repo)

        Mix.shell(Mix.Shell.Process)

        on_exit fn ->
          Mix.shell(Mix.Shell.IO)
        end
      
        :ok
    end

    test "invalid command" do
        Mix.Tasks.Team.run(["invalid", "name"])
        assert_received {:mix_shell, :info, [output]}
        assert output === "Invalid command!"
    end

    test "add and remove a team" do
        team_name = "qwertyuiop"
        qrcode_path = "images/#{team_name}.svg";

        Mix.Tasks.Team.run(["new", team_name])
        assert_received {:mix_shell, :info, [output]}
        assert output === "You're creating a new team called \"#{team_name}\""

        team = Db.Repo.get_by(Db.Teams, name: team_name)
        assert team.name === team_name
        assert File.exists?(qrcode_path)

        Mix.Tasks.Team.run(["remove", team_name])
        assert_received {:mix_shell, :info, [output]}
        assert output === "You're delete the team called \"#{team_name}\"" 

        assert false === File.exists?(qrcode_path)
        assert nil === Db.Repo.get_by(Db.Teams, name: team_name)
    end
end