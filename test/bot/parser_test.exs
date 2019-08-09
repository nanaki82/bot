defmodule Bot.ParserTest do
  use ExUnit.Case

  test "parse simple message" do
    assert %Message{
             date: 1_573_400_913,
             id: 154,
             text: "test message",
             user: %User{
               first_name: "Carlo",
               id: 111_111_111,
               last_name: nil,
               username: "test_username"
             }
           } =
             Test.Stub.message()
             |> Bot.Parser.parse()
  end

  test "parse edited message" do
    assert %EditedMessage{
             date: 1_573_400_913,
             edit_date: 1_573_401_006,
             id: 154,
             text: "test edited message",
             user: %User{
               first_name: "Carlo",
               id: 111_111_111,
               last_name: nil,
               username: "test_username"
             }
           } =
             Test.Stub.edited_message()
             |> Bot.Parser.parse()
  end

  test "parse command" do
    assert %Command{
             args: ["arg1", "arg2"],
             command: "start",
             date: 1_573_407_339,
             id: 158,
             user: %User{
               first_name: "Carlo",
               id: 133_856_935,
               last_name: nil,
               username: "nanaki82"
             }
           } =
             Test.Stub.command()
             |> Bot.Parser.parse()
  end

  test "parse unsupported" do
    assert %{} = Bot.Parser.parse("unsupported message")
  end
end
