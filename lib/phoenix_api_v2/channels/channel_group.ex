defmodule Api.Channels.ChannelGroup do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name]}
  schema "channel_groups" do
    field :name, :string

    has_many :channels, Api.Channels.Channel

    timestamps()
  end

  @doc false
  def changeset(channel_group, attrs) do
    channel_group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
