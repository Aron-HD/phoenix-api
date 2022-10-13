defmodule Api.StbsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.Stbs` context.
  """
  require Api.UtilFixture

  @doc """
  Generate a stb.
  """
  def stb_fixture(attrs \\ %{}, preload \\ []) do
    assoc = %{stb_group: stb_group_fixture()}

    {:ok, stb} =
      attrs
      |> Enum.into(%{
        active_status: true,
        code: "some code",
        ip_address: "some ip_address",
        mac_address: "some mac_address",
        muted: true,
        name: "some name"
      })
      |> Api.Stbs.create_stb()

    # stb
    Api.UtilFixture.merge_preload(stb, preload, assoc)
  end

  @doc """
  Generate a stb_group.
  """
  def stb_group_fixture(attrs \\ %{}) do
    {:ok, stb_group} =
      attrs
      |> Enum.into(%{
        name: "some name",
        theme_color: "some theme_color"
      })
      |> Api.Stbs.create_stb_group()

    stb_group
  end
end
