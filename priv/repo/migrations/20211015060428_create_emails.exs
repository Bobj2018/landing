defmodule Loor.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :email, :string
      add :landing_id, references(:landings, on_delete: :delete_all)

      timestamps()
    end

    create index(:emails, [:landing_id])
  end
end
