defmodule Command do
  defstruct [:user, :id, :date, :command, args: []]

  @type t :: %Command{
          user: User.t(),
          id: integer,
          date: integer,
          command: Strnig.t(),
          args: list(String.t())
        }
end

defimpl String.Chars, for: Command do
  @spec to_string(Command.t()) :: String.t()
  def to_string(%Command{user: user, id: id, date: date, command: command, args: args}) do
    "(#{date}) [#{user}] ##{id}: /#{command} #{args}"
  end
end

defimpl Bot.Message, for: Command do
  @spec handle(Command.t()) :: any
  def handle(%Command{command: command, args: args, user: %User{id: id, first_name: first_name}}) do
    Bot.Handler.Command.handle(command, id, first_name, args)
  end
end
