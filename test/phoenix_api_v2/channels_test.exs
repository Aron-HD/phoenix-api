defmodule Api.ChannelsTest do
  use Api.DataCase

  alias Api.Channels

  describe "channels" do
    alias Api.Channels.Channel

    import Api.ChannelsFixtures

    @invalid_attrs %{channel_number: nil, mode: nil, name: nil, stream_address: nil, stream_port: nil}

    test "list_channels/0 returns all channels" do
      channel = channel_fixture()
      assert Channels.list_channels() == [channel]
    end

    test "get_channel!/1 returns the channel with given id" do
      channel = channel_fixture()
      assert Channels.get_channel!(channel.id) == channel
    end

    test "create_channel/1 with valid data creates a channel" do
      valid_attrs = %{channel_number: 42, mode: 42, name: "some name", stream_address: "some stream_address", stream_port: 42}

      assert {:ok, %Channel{} = channel} = Channels.create_channel(valid_attrs)
      assert channel.channel_number == 42
      assert channel.mode == 42
      assert channel.name == "some name"
      assert channel.stream_address == "some stream_address"
      assert channel.stream_port == 42
    end

    test "create_channel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Channels.create_channel(@invalid_attrs)
    end

    test "update_channel/2 with valid data updates the channel" do
      channel = channel_fixture()
      update_attrs = %{channel_number: 43, mode: 43, name: "some updated name", stream_address: "some updated stream_address", stream_port: 43}

      assert {:ok, %Channel{} = channel} = Channels.update_channel(channel, update_attrs)
      assert channel.channel_number == 43
      assert channel.mode == 43
      assert channel.name == "some updated name"
      assert channel.stream_address == "some updated stream_address"
      assert channel.stream_port == 43
    end

    test "update_channel/2 with invalid data returns error changeset" do
      channel = channel_fixture()
      assert {:error, %Ecto.Changeset{}} = Channels.update_channel(channel, @invalid_attrs)
      assert channel == Channels.get_channel!(channel.id)
    end

    test "delete_channel/1 deletes the channel" do
      channel = channel_fixture()
      assert {:ok, %Channel{}} = Channels.delete_channel(channel)
      assert_raise Ecto.NoResultsError, fn -> Channels.get_channel!(channel.id) end
    end

    test "change_channel/1 returns a channel changeset" do
      channel = channel_fixture()
      assert %Ecto.Changeset{} = Channels.change_channel(channel)
    end
  end

  describe "channel_groups" do
    alias Api.Channels.ChannelGroup

    import Api.ChannelsFixtures

    @invalid_attrs %{name: nil}

    test "list_channel_groups/0 returns all channel_groups" do
      channel_group = channel_group_fixture()
      assert Channels.list_channel_groups() == [channel_group]
    end

    test "get_channel_group!/1 returns the channel_group with given id" do
      channel_group = channel_group_fixture()
      assert Channels.get_channel_group!(channel_group.id) == channel_group
    end

    test "create_channel_group/1 with valid data creates a channel_group" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %ChannelGroup{} = channel_group} = Channels.create_channel_group(valid_attrs)
      assert channel_group.name == "some name"
    end

    test "create_channel_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Channels.create_channel_group(@invalid_attrs)
    end

    test "update_channel_group/2 with valid data updates the channel_group" do
      channel_group = channel_group_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %ChannelGroup{} = channel_group} = Channels.update_channel_group(channel_group, update_attrs)
      assert channel_group.name == "some updated name"
    end

    test "update_channel_group/2 with invalid data returns error changeset" do
      channel_group = channel_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Channels.update_channel_group(channel_group, @invalid_attrs)
      assert channel_group == Channels.get_channel_group!(channel_group.id)
    end

    test "delete_channel_group/1 deletes the channel_group" do
      channel_group = channel_group_fixture()
      assert {:ok, %ChannelGroup{}} = Channels.delete_channel_group(channel_group)
      assert_raise Ecto.NoResultsError, fn -> Channels.get_channel_group!(channel_group.id) end
    end

    test "change_channel_group/1 returns a channel_group changeset" do
      channel_group = channel_group_fixture()
      assert %Ecto.Changeset{} = Channels.change_channel_group(channel_group)
    end
  end
end
