defmodule ApiWeb.StbControllerTest do
  use ApiWeb.ConnCase

  import Api.StbsFixtures

  alias Api.Stbs.Stb

  @create_attrs %{
    active_status: true,
    code: "some code",
    ip_address: "some ip_address",
    mac_address: "some mac_address",
    muted: true,
    name: "some name"
    # stbGroupId: 1
  }
  @update_attrs %{
    active_status: false,
    code: "some updated code",
    ip_address: "some updated ip_address",
    mac_address: "some updated mac_address",
    muted: false,
    name: "some updated name"
    # stbGroupId: 2
  }
  @invalid_attrs %{
    active_status: nil,
    code: nil,
    ip_address: nil,
    mac_address: nil,
    muted: nil,
    name: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stbs", %{conn: conn} do
      conn = get(conn, Routes.stb_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stb" do
    test "renders stb when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stb_path(conn, :create), data: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stb_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "code" => "some code",
               "name" => "some name",
               "ipAddress" => "some ip_address",
               "macAddress" => "some mac_address",
               "activeStatus" => true,
               "muted" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stb_path(conn, :create), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stb" do
    setup [:create_stb]

    test "renders stb when data is valid", %{conn: conn, data: %Stb{id: id} = stb} do
      conn = put(conn, Routes.stb_path(conn, :update, stb), data: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stb_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "activeStatus" => false,
               "code" => "some updated code",
               "ipAddress" => "some updated ip_address",
               "macAddress" => "some updated mac_address",
               "muted" => false,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, data: stb} do
      conn = put(conn, Routes.stb_path(conn, :update, stb), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stb" do
    setup [:create_stb]

    test "deletes chosen stb", %{conn: conn, data: stb} do
      conn = delete(conn, Routes.stb_path(conn, :delete, stb))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stb_path(conn, :show, stb))
      end
    end
  end

  defp create_stb(_) do
    stb = stb_fixture()
    %{data: stb}
  end
end
