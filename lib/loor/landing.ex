defmodule Loor.Landing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "landings" do
    field :button_text, :string
    field :call_to_action, :string
    field :header_text, :string
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(landing, attrs \\ %{}) do
    landing
    |> cast(attrs, [:title, :header_text, :call_to_action, :slug, :button_text])
    |> validate_required([:title, :header_text, :call_to_action, :slug, :button_text])
  end
end
