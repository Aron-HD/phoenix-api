defmodule ApiWeb.ChannelGroupController do
  use ApiWeb, :controller

  alias Api.Channels
  alias Api.Channels.ChannelGroup

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    channel_groups = Channels.list_channel_groups()
    render(conn, "index.json", channel_groups: channel_groups)
  end

  def create(conn, %{"data" => channel_group_params}) do
    with {:ok, %ChannelGroup{} = channel_group} <-
           Channels.create_channel_group(channel_group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.channel_group_path(conn, :show, channel_group))
      |> render("show.json", channel_group: channel_group)
    end
  end

  def show(conn, %{"id" => id}) do
    channel_group = Channels.get_channel_group!(id)
    render(conn, "show.json", channel_group: channel_group)
  end

  def update(conn, %{"id" => id, "data" => channel_group_params}) do
    channel_group = Channels.get_channel_group!(id)

    with {:ok, %ChannelGroup{} = channel_group} <-
           Channels.update_channel_group(channel_group, channel_group_params) do
      render(conn, "show.json", channel_group: channel_group)
    end
  end

  def delete(conn, %{"id" => id}) do
    channel_group = Channels.get_channel_group!(id)

    with {:ok, %ChannelGroup{}} <- Channels.delete_channel_group(channel_group) do
      send_resp(conn, :no_content, "")
    end
  end
end
