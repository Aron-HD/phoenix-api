defmodule Api.Stbs.StbGroup do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :theme_color]}
  schema "stb_groups" do
    field :name, :string
    field :theme_color, :string

    has_many :stbs, Api.Stbs.Stb

    timestamps()
  end

  @doc false
  def changeset(stb_group, attrs) do
    stb_group
    |> cast(attrs, [:name, :theme_color])
    |> validate_required([:name])
  end
end
