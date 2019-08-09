defprotocol Bot.Message do
  @fallback_to_any true

  @doc "Handle the message"
  def handle(data)
end

defimpl Bot.Message, for: Any do
  @spec handle(any) :: any
  def handle(_) do
    IO.puts("Handling not implemented yet")
  end
end
