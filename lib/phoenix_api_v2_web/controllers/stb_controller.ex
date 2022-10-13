defmodule ApiWeb.StbController do
  use ApiWeb, :controller

  alias Api.Stbs
  alias Api.Stbs.Stb

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    stbs = Stbs.list_stbs()
    render(conn, "index.json", stbs: stbs)
  end

  def create(conn, %{"data" => stb_params}) do
    with {:ok, %Stb{} = stb} <- Stbs.create_stb(stb_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.stb_path(conn, :show, stb))
      |> render("show.json", stb: stb)
    end
  end

  def show(conn, %{"id" => id}) do
    stb = Stbs.get_stb!(id)
    render(conn, "show.json", stb: stb)
  end

  def update(conn, %{"id" => id, "data" => stb_params}) do
    stb = Stbs.get_stb!(id)

    with {:ok, %Stb{} = stb} <- Stbs.update_stb(stb, stb_params) do
      render(conn, "show.json", stb: stb)
    end
  end

  def delete(conn, %{"id" => id}) do
    stb = Stbs.get_stb!(id)

    with {:ok, %Stb{}} <- Stbs.delete_stb(stb) do
      send_resp(conn, :no_content, "")
    end
  end
end
