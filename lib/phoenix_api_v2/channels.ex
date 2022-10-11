defmodule Api.Channels do
  @moduledoc """
  The Channels context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Channels.Channel

  @doc """
  Returns the list of channels.

  ## Examples

      iex> list_channels()
      [%Channel{}, ...]

  """
  def list_channels do
    Channel
    |> order_by(asc: :id)
    |> Repo.all()
    |> Repo.preload(:channel_group)
  end

  @doc """
  Gets a single channel.

  Raises `Ecto.NoResultsError` if the Channel does not exist.

  ## Examples

      iex> get_channel!(123)
      %Channel{}

      iex> get_channel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_channel!(id) do
    Channel
    |> Repo.get!(id)
    |> Repo.preload(:channel_group)
  end

  @doc """
  Creates a channel.

  ## Examples

      iex> create_channel(%{field: value})
      {:ok, %Channel{}}

      iex> create_channel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_channel(attrs \\ %{}) do
    %Channel{}
    |> Channel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a channel.

  ## Examples

      iex> update_channel(channel, %{field: new_value})
      {:ok, %Channel{}}

      iex> update_channel(channel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_channel(%Channel{} = channel, attrs) do
    channel
    |> Channel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a channel.

  ## Examples

      iex> delete_channel(channel)
      {:ok, %Channel{}}

      iex> delete_channel(channel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_channel(%Channel{} = channel) do
    Repo.delete(channel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking channel changes.

  ## Examples

      iex> change_channel(channel)
      %Ecto.Changeset{data: %Channel{}}

  """
  def change_channel(%Channel{} = channel, attrs \\ %{}) do
    Channel.changeset(channel, attrs)
  end

  alias Api.Channels.ChannelGroup

  @doc """
  Returns the list of channel_groups.

  ## Examples

      iex> list_channel_groups()
      [%ChannelGroup{}, ...]

  """
  def list_channel_groups do
    ChannelGroup
    |> order_by(asc: :id)
    |> Repo.all()
    |> Repo.preload(:channels)
  end

  @doc """
  Gets a single channel_group.

  Raises `Ecto.NoResultsError` if the Channel group does not exist.

  ## Examples

      iex> get_channel_group!(123)
      %ChannelGroup{}

      iex> get_channel_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_channel_group!(id) do
    ChannelGroup
    |> Repo.get!(id)
    |> Repo.preload(:channels)
  end

  @doc """
  Creates a channel_group.

  ## Examples

      iex> create_channel_group(%{field: value})
      {:ok, %ChannelGroup{}}

      iex> create_channel_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_channel_group(attrs \\ %{}) do
    %ChannelGroup{}
    |> ChannelGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a channel_group.

  ## Examples

      iex> update_channel_group(channel_group, %{field: new_value})
      {:ok, %ChannelGroup{}}

      iex> update_channel_group(channel_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_channel_group(%ChannelGroup{} = channel_group, attrs) do
    channel_group
    |> ChannelGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a channel_group.

  ## Examples

      iex> delete_channel_group(channel_group)
      {:ok, %ChannelGroup{}}

      iex> delete_channel_group(channel_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_channel_group(%ChannelGroup{} = channel_group) do
    Repo.delete(channel_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking channel_group changes.

  ## Examples

      iex> change_channel_group(channel_group)
      %Ecto.Changeset{data: %ChannelGroup{}}

  """
  def change_channel_group(%ChannelGroup{} = channel_group, attrs \\ %{}) do
    ChannelGroup.changeset(channel_group, attrs)
  end
end
