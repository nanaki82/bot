defmodule EditedMessage do
  defstruct [:user, :id, :date, :edit_date, :text]

  @type t :: %EditedMessage{
          user: User.t(),
          id: integer,
          date: integer,
          edit_date: integer,
          text: String.t()
        }
end

defimpl String.Chars, for: EditedMessage do
  @spec to_string(EditedMessage.t()) :: String.t()
  def to_string(%EditedMessage{user: user, id: id, date: date, text: text, edit_date: edit_date}) do
    "(#{edit_date}) [#{user}] ##{id} (#{date}): #{text}"
  end
end

defimpl Bot.Message, for: EditedMessage do
  @spec handle(EditedMessage.t()) :: any
  def handle(_edited_message) do
    nil
  end
end
