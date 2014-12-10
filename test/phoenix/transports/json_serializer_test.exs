defmodule Phoenix.Tranports.JSONSerializerTest do
  use ExUnit.Case, async: true

  alias Phoenix.Transports.JSONSerializer
  alias Phoenix.Socket.Message

  @msg_json "{\"topic\":\"t\",\"message\":\"m\",\"event\":\"e\",\"channel\":\"c\"}"

  test "encode!/1 encodes `Phoenix.Socket.Message` as JSON" do
    msg = %Message{channel: "c", topic: "t", event: "e", message: "m"}
    {:text, encoded_msg} = JSONSerializer.encode!(msg)
    
    assert encoded_msg |> to_string == @msg_json  
  end

  test "decode!/2 decodes `Phoenix.Socket.Message` from JSON" do
    assert %Message{channel: "c", topic: "t", event: "e", message: "m"} ==
      JSONSerializer.decode!(@msg_json, :text)
  end
end
