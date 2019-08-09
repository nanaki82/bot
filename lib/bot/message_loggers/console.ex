defmodule Bot.MessageLogger.Console do
  @moduledoc """
    A simple console logger
  """
  @behaviour Bot.MessageLogger

  require Logger

  def log(message) do
    Logger.info(message)
  end
end
