defmodule Api.Repo.Migrations.CreateStbs do
  use Ecto.Migration

  def change do
    create table(:stbs) do
      add :name, :string
      add :code, :string
      add :ip_address, :string
      add :mac_address, :string
      add :active_status, :boolean, default: false, null: false
      add :muted, :boolean, default: false, null: false

      timestamps()
    end
  end
end
