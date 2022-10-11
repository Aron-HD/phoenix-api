defmodule Api.ChannelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Channels` context.
  """
  require Api.UtilFixture

  @doc """
  Generate a channel.
  """
  def channel_fixture(attrs \\ %{}, preload \\ []) do
    assoc = %{channel_group: channel_group_fixture()}

    {:ok, channel} =
      attrs
      |> Enum.into(%{
        channel_number: 42,
        mode: 1,
        name: "some name",
        stream_address: "some stream_address",
        stream_port: 42,
        channel_group_id: assoc.channel_group.id
      })
      |> Api.Channels.create_channel()

    Api.UtilFixture.merge_preload(channel, preload, assoc)
    # channel
  end

  @doc """
  Generate a channel_group.
  """
  def channel_group_fixture(attrs \\ %{}) do
    # FIXME preload channel_group_fixture
    # , preload \\ []) do
    # assoc = %{channels: channel_fixture()}

    {:ok, channel_group} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Api.Channels.create_channel_group()

    # Api.UtilFixture.merge_preload(channel_group, preload, assoc)
    channel_group
  end
end
