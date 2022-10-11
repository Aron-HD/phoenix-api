defmodule Api.Repo.Migrations.CreateChannelGroups do
  use Ecto.Migration

  def change do
    create table(:channel_groups) do
      add :name, :string

      timestamps()
    end

    alter table(:channels) do
      add :channel_group_id, references(:channel_groups)
    end
  end
end
