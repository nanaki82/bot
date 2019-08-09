defmodule Bot.Parser do
  def parse(%{
        message: %{text: "/" <> command_str, from: from, message_id: message_id, date: date}
      }) do
    [command | args] = String.split(command_str, " ", trim: true)

    struct(Command, %{
      user: parse_user(from),
      id: message_id,
      date: date,
      command: command,
      args: args
    })
  end

  def parse(%{message: %{text: text_message, from: from, message_id: message_id, date: date}}) do
    struct(Message, %{
      user: parse_user(from),
      id: message_id,
      date: date,
      text: text_message
    })
  end

  def parse(%{
        edited_message: %{
          text: text_message,
          from: from,
          message_id: message_id,
          date: date,
          edit_date: edit_date
        }
      }) do
    struct(EditedMessage, %{
      user: parse_user(from),
      id: message_id,
      date: date,
      edit_date: edit_date,
      text: text_message
    })
  end

  def parse(_), do: %{}

  def parse_user(user), do: struct(User, user)
end
