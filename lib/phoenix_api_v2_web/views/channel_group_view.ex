defmodule ApiWeb.ChannelGroupView do
  use ApiWeb, :view
  alias ApiWeb.ChannelGroupView

  def render("index.json", %{channel_groups: channel_groups}) do
    %{data: render_many(channel_groups, ChannelGroupView, "channel_group.json")}
  end

  def render("show.json", %{channel_group: channel_group}) do
    %{data: render_one(channel_group, ChannelGroupView, "channel_group.json")}
  end

  def render("channel_group.json", %{channel_group: channel_group}) do
    %{
      id: channel_group.id,
      name: channel_group.name,
      channels: channel_group.channels
    }
  end
end
