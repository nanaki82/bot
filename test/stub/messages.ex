defmodule Test.Stub do
  def message() do
    %{
      update_id: 4_463_807,
      message: %{
        message_id: 154,
        from: %{
          id: 111_111_111,
          is_bot: false,
          first_name: "Carlo",
          username: "test_username",
          language_code: "en"
        },
        chat: %{
          id: 111_111_111,
          first_name: "Carlo",
          username: "test_username",
          type: "private"
        },
        date: 1_573_400_913,
        text: "test message"
      }
    }
  end

  def edited_message() do
    %{
      update_id: 4_463_808,
      edited_message: %{
        message_id: 154,
        from: %{
          id: 111_111_111,
          is_bot: false,
          first_name: "Carlo",
          username: "test_username",
          language_code: "en"
        },
        chat: %{
          id: 111_111_111,
          first_name: "Carlo",
          username: "test_username",
          type: "private"
        },
        date: 1_573_400_913,
        edit_date: 1_573_401_006,
        text: "test edited message"
      }
    }
  end

  def command() do
    %{
      update_id: 4_463_813,
      message: %{
        message_id: 158,
        from: %{
          id: 133_856_935,
          is_bot: false,
          first_name: "Carlo",
          username: "nanaki82",
          language_code: "en"
        },
        chat: %{
          id: 133_856_935,
          first_name: "Carlo",
          username: "nanaki82",
          type: "private"
        },
        date: 1_573_407_339,
        text: "/start arg1 arg2",
        entities: [
          %{
            offset: 0,
            length: 5,
            type: "bot_command"
          }
        ]
      }
    }
  end
end
