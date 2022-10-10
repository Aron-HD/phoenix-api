defmodule Api.Repo.Migrations.CreateChannels do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :channel_number, :integer
      add :stream_address, :string
      add :stream_port, :integer
      add :mode, :integer

      timestamps()
    end
  end
end
