defmodule LoorWeb.EmailController do
  use LoorWeb, :controller

  import Ecto.Query

  alias Loor.{Repo, Email, Landing}

  def add(conn, %{"email" => email }) do

    %{"landing_id" => id, "email" => email, "slug" => slug} = email
    id = String.to_integer(id)

    [%Landing{} = landing] = Landing |> where(slug: ^slug) |> Repo.all

    changeset = Email.changeset(%Email{}, %{"email" => email, "landing_id" => id})

    case Repo.insert(changeset) do
      {:ok, _landing} ->
        conn
        |> put_flash(:info, "Thank you for signing up!")
        |> redirect(to: "/view/#{slug}")
      {:error, changeset} ->
        render conn, "show_view.html"
  end
end
end
