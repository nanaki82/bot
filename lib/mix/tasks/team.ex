defmodule Mix.Tasks.Team do
  @moduledoc """
      The task is used to add
      or remove a Team
  """
  use Mix.Task

  @bot_name Application.get_env(:bot, :bot_name)

  @shortdoc "create a new team"
  def run(args) do
    [:postgrex, :ecto, :ecto_sql]
    |> Enum.each(&Application.ensure_all_started/1)

    Db.Repo.start_link()

    [command, team_name] = args

    case command do
      "new" ->
        Mix.shell().info("You're creating a new team called \"#{team_name}\"")
        uuid = UUID.uuid4()

        create_qrcode(uuid, team_name)

        %Db.Teams{name: team_name, external_id: uuid}
        |> Db.Repo.insert()

      "remove" ->
        Mix.shell().info("You're delete the team called \"#{team_name}\"")

        remove_qrcode(team_name)

        %Db.Teams{name: team_name}
        |> Db.Repo.delete()

      _ ->
        Mix.shell().info("Invalid command!")
    end
  end

  def get_qrcode_payload(uuid) do
    "https://telegram.me/#{@bot_name}?start=#{uuid}"
  end

  def create_qrcode(uuid, team_name) do
    get_qrcode_payload(uuid)
    |> EQRCode.encode()
    |> EQRCode.svg(color: "#03B6AD", shape: "circle", width: 300)
    |> (&File.write("./images/#{team_name}.svg", &1, [:binary])).()

    :ok
  end

  def remove_qrcode(team_name) do
    File.rm("./images/#{team_name}.svg")

    :ok
  end
end
