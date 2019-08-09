defmodule Message do
  defstruct [:user, :id, :date, :text]

  @type t :: %Message{
          user: User.t(),
          id: integer,
          date: integer,
          text: String.t()
        }
end

defimpl String.Chars, for: Message do
  @spec to_string(Message.t()) :: String.t()
  def to_string(%Message{user: user, id: id, date: date, text: text}) do
    "(#{date}) [#{user}] ##{id}: #{text}"
  end
end

defimpl Bot.Message, for: Message do
  @spec handle(Message.t()) :: any
  def handle(%Message{user: %User{id: id, first_name: first_name}}) do
    Bot.Handler.Message.handle(id, first_name)
  end
end
