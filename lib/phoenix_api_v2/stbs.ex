defmodule Api.Stbs do
  @moduledoc """
  The Stbs context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Stbs.Stb

  @doc """
  Returns the list of stbs.

  ## Examples

      iex> list_stbs()
      [%Stb{}, ...]

  """
  def list_stbs do
    Stb
    |> order_by(asc: :id)
    |> Repo.all()
    |> Repo.preload(:stb_group)
  end

  @doc """
  Gets a single stb.

  Raises `Ecto.NoResultsError` if the Stb does not exist.

  ## Examples

      iex> get_stb!(123)
      %Stb{}

      iex> get_stb!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stb!(id) do
    Stb
    |> Repo.get!(id)
    |> Repo.preload(:stb_group)
  end

  @doc """
  Creates a stb.

  ## Examples

      iex> create_stb(%{field: value})
      {:ok, %Stb{}}

      iex> create_stb(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stb(attrs \\ %{}) do
    with {:ok, %Stb{} = stb} <-
           %Stb{}
           |> Stb.changeset(attrs)
           |> Repo.insert() do
      res =
        stb
        |> Repo.preload(:stb_group)

      {:ok, res}
    end
  end

  @doc """
  Updates a stb.

  ## Examples

      iex> update_stb(stb, %{field: new_value})
      {:ok, %Stb{}}

      iex> update_stb(stb, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stb(%Stb{} = stb, attrs) do
    with {:ok, %Stb{} = stb} <-
           stb
           |> Stb.changeset(attrs)
           |> Repo.update() do
      res =
        stb
        |> Repo.preload(:stb_group)

      {:ok, res}
    end
  end

  @doc """
  Deletes a stb.

  ## Examples

      iex> delete_stb(stb)
      {:ok, %Stb{}}

      iex> delete_stb(stb)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stb(%Stb{} = stb) do
    Repo.delete(stb)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stb changes.

  ## Examples

      iex> change_stb(stb)
      %Ecto.Changeset{data: %Stb{}}

  """
  def change_stb(%Stb{} = stb, attrs \\ %{}) do
    Stb.changeset(stb, attrs)
  end

  alias Api.Stbs.StbGroup

  @doc """
  Returns the list of stb_groups.

  ## Examples

      iex> list_stb_groups()
      [%StbGroup{}, ...]

  """
  def list_stb_groups do
    StbGroup
    |> order_by(asc: :id)
    |> Repo.all()
    |> Repo.preload(:stbs)
  end

  @doc """
  Gets a single stb_group.

  Raises `Ecto.NoResultsError` if the Stb group does not exist.

  ## Examples

      iex> get_stb_group!(123)
      %StbGroup{}

      iex> get_stb_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stb_group!(id) do
    StbGroup
    |> Repo.get!(id)
    |> Repo.preload(:stbs)
  end

  @doc """
  Creates a stb_group.

  ## Examples

      iex> create_stb_group(%{field: value})
      {:ok, %StbGroup{}}

      iex> create_stb_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stb_group(attrs \\ %{}) do
    %StbGroup{}
    |> StbGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stb_group.

  ## Examples

      iex> update_stb_group(stb_group, %{field: new_value})
      {:ok, %StbGroup{}}

      iex> update_stb_group(stb_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stb_group(%StbGroup{} = stb_group, attrs) do
    stb_group
    |> StbGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stb_group.

  ## Examples

      iex> delete_stb_group(stb_group)
      {:ok, %StbGroup{}}

      iex> delete_stb_group(stb_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stb_group(%StbGroup{} = stb_group) do
    Repo.delete(stb_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stb_group changes.

  ## Examples

      iex> change_stb_group(stb_group)
      %Ecto.Changeset{data: %StbGroup{}}

  """
  def change_stb_group(%StbGroup{} = stb_group, attrs \\ %{}) do
    StbGroup.changeset(stb_group, attrs)
  end
end
