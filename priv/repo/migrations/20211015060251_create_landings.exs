defmodule Loor.Repo.Migrations.CreateLandings do
  use Ecto.Migration

  def change do
    create table(:landings) do
      add :title, :string
      add :header_text, :string
      add :call_to_action, :string
      add :slug, :string
      add :button_text, :string

      timestamps()
    end

  end
end
