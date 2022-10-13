defmodule ApiWeb.StbGroupController do
  use ApiWeb, :controller

  alias Api.Stbs
  alias Api.Stbs.StbGroup

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    stb_groups = Stbs.list_stb_groups()
    render(conn, "index.json", stb_groups: stb_groups)
  end

  def create(conn, %{"data" => stb_group_params}) do
    with {:ok, %StbGroup{} = stb_group} <- Stbs.create_stb_group(stb_group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.stb_group_path(conn, :show, stb_group))
      |> render("show.json", stb_group: stb_group)
    end
  end

  def show(conn, %{"id" => id}) do
    stb_group = Stbs.get_stb_group!(id)
    render(conn, "show.json", stb_group: stb_group)
  end

  def update(conn, %{"id" => id, "data" => stb_group_params}) do
    stb_group = Stbs.get_stb_group!(id)

    with {:ok, %StbGroup{} = stb_group} <- Stbs.update_stb_group(stb_group, stb_group_params) do
      render(conn, "show.json", stb_group: stb_group)
    end
  end

  def delete(conn, %{"id" => id}) do
    stb_group = Stbs.get_stb_group!(id)

    with {:ok, %StbGroup{}} <- Stbs.delete_stb_group(stb_group) do
      send_resp(conn, :no_content, "")
    end
  end
end
