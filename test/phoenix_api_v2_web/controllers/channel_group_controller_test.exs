defmodule ApiWeb.ChannelGroupControllerTest do
  use ApiWeb.ConnCase

  import Api.ChannelsFixtures

  alias Api.Channels.ChannelGroup

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all channel_groups", %{conn: conn} do
      conn = get(conn, Routes.channel_group_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create channel_group" do
    # FIXME channel_group_controller test
    @tag :skip
    test "renders channel_group when data is valid", %{conn: conn} do
      conn = post(conn, Routes.channel_group_path(conn, :create), data: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.channel_group_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.channel_group_path(conn, :create), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update channel_group" do
    setup [:create_channel_group]

    test "renders channel_group when data is valid", %{
      conn: conn,
      data: %ChannelGroup{id: id} = channel_group
    } do
      conn =
        put(conn, Routes.channel_group_path(conn, :update, channel_group), data: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.channel_group_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, data: channel_group} do
      conn =
        put(conn, Routes.channel_group_path(conn, :update, channel_group), data: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete channel_group" do
    setup [:create_channel_group]

    test "deletes chosen channel_group", %{conn: conn, data: channel_group} do
      conn = delete(conn, Routes.channel_group_path(conn, :delete, channel_group))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.channel_group_path(conn, :show, channel_group))
      end
    end
  end

  defp create_channel_group(_) do
    channel_group = channel_group_fixture()
    %{data: channel_group}
  end
end
