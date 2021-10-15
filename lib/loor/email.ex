defmodule Loor.Email do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emails" do
    field :email, :string
    field :landing_id, :id

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:email, :landing_id])
    |> validate_required([:email, :landing_id])
  end
end
