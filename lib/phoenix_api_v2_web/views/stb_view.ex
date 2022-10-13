defmodule ApiWeb.StbView do
  use ApiWeb, :view
  alias ApiWeb.StbView

  def render("index.json", %{stbs: stbs}) do
    %{data: render_many(stbs, StbView, "stb.json")}
  end

  def render("show.json", %{stb: stb}) do
    %{data: render_one(stb, StbView, "stb.json")}
  end

  def render("stb.json", %{stb: stb}) do
    %{
      id: stb.id,
      name: stb.name,
      code: stb.code,
      ip_address: stb.ip_address,
      mac_address: stb.mac_address,
      active_status: stb.active_status,
      muted: stb.muted,
      stb_group: stb.stb_group
    }
  end
end
