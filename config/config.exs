use Mix.Config

config :bot,
  ecto_repos: [Db.Repo],
  parser: Bot.Parser,
  handler: Bot.Message,
  message_logger: Bot.ConsoleMessageLogger

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :bot, Db.Repo,
  database: System.get_env("BOT_DB_NAME"),
  username: System.get_env("BOT_DB_USER"),
  password: System.get_env("BOT_DB_PASS"),
  hostname: System.get_env("BOT_DB_HOST")

config :bot,
  bot_name: System.get_env("BOT_NAME")

config :nadia,
  token: System.get_env("BOT_TOKEN"),
  recv_timeout: 10

import_config "config.#{Mix.env()}.exs"

if File.exists?("./config/#{Mix.env()}.secret.exs") do
  import_config "#{Mix.env()}.secret.exs"
end
