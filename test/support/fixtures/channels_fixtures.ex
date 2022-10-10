defmodule Api.ChannelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Channels` context.
  """

  @doc """
  Generate a channel.
  """
  def channel_fixture(attrs \\ %{}) do
    {:ok, channel} =
      attrs
      |> Enum.into(%{
        channel_number: 42,
        mode: 42,
        name: "some name",
        stream_address: "some stream_address",
        stream_port: 42
      })
      |> Api.Channels.create_channel()

    channel
  end
end
