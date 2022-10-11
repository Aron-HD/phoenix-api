defmodule Api.Channels.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :mode, :stream_address, :stream_port]}
  schema "channels" do
    field :channel_number, :integer
    field :mode, Ecto.Enum, values: [UDP: 1, RTP: 2]
    field :name, :string
    field :stream_address, :string
    field :stream_port, :integer
    belongs_to :channel_group, Api.Channels.ChannelGroup

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [
      :name,
      :channel_number,
      :stream_address,
      :stream_port,
      :mode,
      :channel_group_id
    ])
    |> validate_required([])
  end
end
