defmodule Bot.Handler.Message do
  def handle(id, name) do
    case Nadia.send_message(id, "ricevuto sir #{name}!") do
      {:ok, _result} -> :ok
      {:error, %Nadia.Model.Error{reason: "Please wait a little"}} -> :wait
    end
  end
end
