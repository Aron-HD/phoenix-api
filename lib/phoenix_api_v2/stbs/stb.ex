defmodule Api.Stbs.Stb do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [:id, :name, :code, :ip_address, :mac_address, :active_status, :muted]}
  schema "stbs" do
    field :name, :string
    field :code, :string
    field :ip_address, :string
    field :mac_address, :string
    field :active_status, :boolean, default: true
    field :muted, :boolean, default: false

    belongs_to :stb_group, Api.Stbs.StbGroup

    timestamps()
  end

  @doc false
  def changeset(stb, attrs) do
    stb
    |> cast(attrs, [
      :name,
      :code,
      :ip_address,
      :mac_address,
      :active_status,
      :muted,
      :stb_group_id
    ])
    |> validate_required([:name])

    # |> unique_constraint([:stb_group_id])
    # |> put_assoc(:stb_group, attrs.stb_group)
  end
end
