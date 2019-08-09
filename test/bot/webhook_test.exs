defmodule Bot.WebhookTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Bot.Webhook.init([])
  @message "{}"

  test "returns 204 no content" do
    conn = conn(:post, "/", @message)

    conn = Bot.Webhook.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 204
    assert conn.resp_body == ""
  end
end
