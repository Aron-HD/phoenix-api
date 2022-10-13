defmodule ApiWeb.StbGroupControllerTest do
  use ApiWeb.ConnCase

  import Api.StbsFixtures

  alias Api.Stbs.StbGroup

  @create_attrs %{
    name: "some name",
    theme_color: "some theme_color"
  }
  @update_attrs %{
    name: "some updated name",
    theme_color: "some updated theme_color"
  }
  @invalid_attrs %{name: nil, theme_color: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all stb_groups", %{conn: conn} do
      conn = get(conn, Routes.stb_group_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create stb_group" do
    @tag :skip
    test "renders stb_group when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stb_group_path(conn, :create), data: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.stb_group_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name",
               "themeColor" => "some theme_color"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stb_group_path(conn, :create), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update stb_group" do
    setup [:create_stb_group]

    test "renders stb_group when data is valid", %{
      conn: conn,
      data: %StbGroup{id: id} = stb_group
    } do
      conn = put(conn, Routes.stb_group_path(conn, :update, stb_group), data: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.stb_group_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "themeColor" => "some updated theme_color"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, data: stb_group} do
      conn = put(conn, Routes.stb_group_path(conn, :update, stb_group), data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete stb_group" do
    setup [:create_stb_group]

    test "deletes chosen stb_group", %{conn: conn, data: stb_group} do
      conn = delete(conn, Routes.stb_group_path(conn, :delete, stb_group))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.stb_group_path(conn, :show, stb_group))
      end
    end
  end

  defp create_stb_group(_) do
    stb_group = stb_group_fixture()
    %{data: stb_group}
  end
end
