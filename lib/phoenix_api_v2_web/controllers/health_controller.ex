defmodule ApiWeb.HealthController do
  # pulls in plug macros
  use ApiWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 204, "")
  end
end
