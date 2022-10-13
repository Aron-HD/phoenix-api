defmodule ApiWeb.StbGroupView do
  use ApiWeb, :view
  alias ApiWeb.StbGroupView

  def render("index.json", %{stb_groups: stb_groups}) do
    %{data: render_many(stb_groups, StbGroupView, "stb_group.json")}
  end

  def render("show.json", %{stb_group: stb_group}) do
    %{data: render_one(stb_group, StbGroupView, "stb_group.json")}
  end

  def render("stb_group.json", %{stb_group: stb_group}) do
    %{
      id: stb_group.id,
      name: stb_group.name,
      theme_color: stb_group.theme_color,
      stbs: stb_group.stbs
    }
  end
end
