defmodule Api.Channels.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channels" do
    field :channel_number, :integer
    field :mode, Ecto.Enum, values: [UDP: 1, RTP: 2]
    field :name, :string
    field :stream_address, :string
    field :stream_port, :integer

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name, :channel_number, :stream_address, :stream_port, :mode])
    |> validate_required([])
  end
end
