defmodule ApiWeb.ChannelView do
  use ApiWeb, :view
  alias ApiWeb.ChannelView

  def render("index.json", %{channels: channels}) do
    %{data: render_many(channels, ChannelView, "channel.json")}
  end

  def render("show.json", %{channel: channel}) do
    %{data: render_one(channel, ChannelView, "channel.json")}
  end

  def render("channel.json", %{channel: channel}) do
    %{
      id: channel.id,
      name: channel.name,
      channel_number: channel.channel_number,
      stream_address: channel.stream_address,
      stream_port: channel.stream_port,
      mode: channel.mode,
      channel_group: channel.channel_group
    }
  end
end
