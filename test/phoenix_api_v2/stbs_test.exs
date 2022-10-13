defmodule Api.StbsTest do
  use Api.DataCase

  alias Api.Stbs

  describe "stbs" do
    alias Api.Stbs.Stb

    import Api.StbsFixtures

    @invalid_attrs %{
      active_status: nil,
      code: nil,
      ip_address: nil,
      mac_address: nil,
      muted: nil,
      name: nil
    }

    test "list_stbs/0 returns all stbs" do
      stb = stb_fixture(%{}, [:stb_group])
      assert Stbs.list_stbs() == [stb]
    end

    test "get_stb!/1 returns the stb with given id" do
      stb = stb_fixture(%{}, [:stb_group])
      assert Stbs.get_stb!(stb.id) == stb
    end

    test "create_stb/1 with valid data creates a stb" do
      valid_attrs = %{
        active_status: true,
        code: "some code",
        ip_address: "some ip_address",
        mac_address: "some mac_address",
        muted: true,
        name: "some name"
      }

      assert {:ok, %Stb{} = stb} = Stbs.create_stb(valid_attrs)
      assert stb.active_status == true
      assert stb.code == "some code"
      assert stb.ip_address == "some ip_address"
      assert stb.mac_address == "some mac_address"
      assert stb.muted == true
      assert stb.name == "some name"
    end

    test "create_stb/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stbs.create_stb(@invalid_attrs)
    end

    test "update_stb/2 with valid data updates the stb" do
      stb = stb_fixture(%{}, [:stb_group])

      update_attrs = %{
        active_status: false,
        code: "some updated code",
        ip_address: "some updated ip_address",
        mac_address: "some updated mac_address",
        muted: false,
        name: "some updated name"
      }

      assert {:ok, %Stb{} = stb} = Stbs.update_stb(stb, update_attrs)
      assert stb.active_status == false
      assert stb.code == "some updated code"
      assert stb.ip_address == "some updated ip_address"
      assert stb.mac_address == "some updated mac_address"
      assert stb.muted == false
      assert stb.name == "some updated name"
    end

    test "update_stb/2 with invalid data returns error changeset" do
      stb = stb_fixture(%{}, [:stb_group])
      assert {:error, %Ecto.Changeset{}} = Stbs.update_stb(stb, @invalid_attrs)
      assert stb == Stbs.get_stb!(stb.id)
    end

    test "delete_stb/1 deletes the stb" do
      stb = stb_fixture(%{}, [:stb_group])
      assert {:ok, %Stb{}} = Stbs.delete_stb(stb)
      assert_raise Ecto.NoResultsError, fn -> Stbs.get_stb!(stb.id) end
    end

    test "change_stb/1 returns a stb changeset" do
      stb = stb_fixture(%{}, [:stb_group])
      assert %Ecto.Changeset{} = Stbs.change_stb(stb)
    end
  end

  describe "stb_groups" do
    alias Api.Stbs.StbGroup

    import Api.StbsFixtures

    @invalid_attrs %{name: nil, theme_color: nil}

    test "list_stb_groups/0 returns all stb_groups" do
      stb_group = stb_group_fixture()
      assert Stbs.list_stb_groups() == [stb_group]
    end

    test "get_stb_group!/1 returns the stb_group with given id" do
      stb_group = stb_group_fixture()
      assert Stbs.get_stb_group!(stb_group.id) == stb_group
    end

    test "create_stb_group/1 with valid data creates a stb_group" do
      valid_attrs = %{name: "some name", theme_color: "some theme_color"}

      assert {:ok, %StbGroup{} = stb_group} = Stbs.create_stb_group(valid_attrs)
      assert stb_group.name == "some name"
      assert stb_group.theme_color == "some theme_color"
    end

    test "create_stb_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stbs.create_stb_group(@invalid_attrs)
    end

    test "update_stb_group/2 with valid data updates the stb_group" do
      stb_group = stb_group_fixture()
      update_attrs = %{name: "some updated name", theme_color: "some updated theme_color"}

      assert {:ok, %StbGroup{} = stb_group} = Stbs.update_stb_group(stb_group, update_attrs)
      assert stb_group.name == "some updated name"
      assert stb_group.theme_color == "some updated theme_color"
    end

    test "update_stb_group/2 with invalid data returns error changeset" do
      stb_group = stb_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Stbs.update_stb_group(stb_group, @invalid_attrs)
      assert stb_group == Stbs.get_stb_group!(stb_group.id)
    end

    test "delete_stb_group/1 deletes the stb_group" do
      stb_group = stb_group_fixture()
      assert {:ok, %StbGroup{}} = Stbs.delete_stb_group(stb_group)
      assert_raise Ecto.NoResultsError, fn -> Stbs.get_stb_group!(stb_group.id) end
    end

    test "change_stb_group/1 returns a stb_group changeset" do
      stb_group = stb_group_fixture()
      assert %Ecto.Changeset{} = Stbs.change_stb_group(stb_group)
    end
  end
end
