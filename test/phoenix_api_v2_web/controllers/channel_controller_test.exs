defmodule ApiWeb.ChannelControllerTest do
  use ApiWeb.ConnCase

  import Api.ChannelsFixtures

  alias Api.Channels.Channel

  @create_attrs %{
    channel_number: 42,
    mode: 42,
    name: "some name",
    stream_address: "some stream_address",
    stream_port: 42
  }
  @update_attrs %{
    channel_number: 43,
    mode: 43,
    name: "some updated name",
    stream_address: "some updated stream_address",
    stream_port: 43
  }
  @invalid_attrs %{channel_number: nil, mode: nil, name: nil, stream_address: nil, stream_port: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all channels", %{conn: conn} do
      conn = get(conn, Routes.channel_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create channel" do
    test "renders channel when data is valid", %{conn: conn} do
      conn = post(conn, Routes.channel_path(conn, :create), channel: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.channel_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "channel_number" => 42,
               "mode" => 42,
               "name" => "some name",
               "stream_address" => "some stream_address",
               "stream_port" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.channel_path(conn, :create), channel: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update channel" do
    setup [:create_channel]

    test "renders channel when data is valid", %{conn: conn, channel: %Channel{id: id} = channel} do
      conn = put(conn, Routes.channel_path(conn, :update, channel), channel: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.channel_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "channel_number" => 43,
               "mode" => 43,
               "name" => "some updated name",
               "stream_address" => "some updated stream_address",
               "stream_port" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, channel: channel} do
      conn = put(conn, Routes.channel_path(conn, :update, channel), channel: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete channel" do
    setup [:create_channel]

    test "deletes chosen channel", %{conn: conn, channel: channel} do
      conn = delete(conn, Routes.channel_path(conn, :delete, channel))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.channel_path(conn, :show, channel))
      end
    end
  end

  defp create_channel(_) do
    channel = channel_fixture()
    %{channel: channel}
  end
end
