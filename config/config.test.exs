use Mix.Config

config :bot,
  parser: Bot.Stub.Parser,
  handler: Bot.Stub.Message

config :bot, Db.Repo, pool: Ecto.Adapters.SQL.Sandbox

# config :logger, level: :error
