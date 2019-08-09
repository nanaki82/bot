defmodule Bot.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        # change to https
        scheme: :http,
        plug: Bot.Webhook,
        options: [
          port: 8443
          # keyfile: "priv/bot.key",
          # certfile: "priv/bot.pem",
          # otp_app: :bot
        ]
      ),
      Db.Repo
    ]

    opts = [strategy: :one_for_one, name: Bot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
