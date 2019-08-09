defmodule Bot.Webhook do
  @moduledoc """
    The Plug connection that receive
    the Telegram updates
  """
  import Plug.Conn
  @parser Application.get_env(:bot, :parser)
  @handler Application.get_env(:bot, :handler)

  def init(options), do: options

  def call(conn, _) do
    conn
    |> parse_updates()
    |> send_resp(204, "")
  end

  defp parse_updates(conn) do
    {:ok, data, _} = read_body(conn)

    Jason.decode!(data, %{keys: :atoms})
    |> @parser.parse()
    |> @handler.handle()

    conn
  end
end
