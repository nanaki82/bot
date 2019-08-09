defmodule Bot.MessageLogger do
  @callback log(Map.t()) :: {:ok, term} | {:error, String.t()}
end
