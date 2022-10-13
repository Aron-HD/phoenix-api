defmodule Api.Repo.Migrations.CreateStbGroups do
  use Ecto.Migration

  def change do
    create table(:stb_groups) do
      add :name, :string
      add :theme_color, :string

      timestamps()
    end

    alter table(:stbs) do
      add :stb_group_id, references(:stb_groups)
    end
  end
end
