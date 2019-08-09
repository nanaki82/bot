defmodule Bot.Handler.Command do
  def handle(:start, chat_id, name, [code | _]) do
    handle(:register, chat_id, name, code)
  end

  def handle(:register, chat_id, name, code) do
    with nil <- Db.Repo.get(Db.Hunters, chat_id),
         team when team !== nil <- Db.Repo.get_by(Db.Teams, external_id: code) do
      %Db.Hunters{
        id: chat_id,
        name: name,
        team_id: team.name
      }
      |> Db.Repo.insert()

      :ok
    else
      nil ->
        {:error, "The team doesn't exist"}
      hunter ->
        {:error, "The hunter is already registered: #{hunter.name}"}
    end
  end

  def handle(_, _chat_id, _, _) do
    IO.puts("Command not supported")
    {:error, "Unsupported command"}
  end
end
