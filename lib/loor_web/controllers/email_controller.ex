defmodule LoorWeb.EmailController do
  use LoorWeb, :controller

  alias Loor.{Repo, Email}

  def add(conn, %{"email" => email }) do

    %{"landing_id" => id, "email" => email, "slug" => uuid} = email

    id = String.to_integer(id)

    changeset = Email.changeset(%Email{}, %{"email" => email, "landing_id" => id})

    IO.inspect(conn)

    case Repo.insert(changeset) do
      {:ok, _landing} ->
        conn
        |> put_flash(:info, "Thank you for signing up!")
        |> redirect(to: Routes.landing_path(conn, :view, uuid ))
      {:error, changeset} ->
        render conn, "show.html", changeset: changeset
  end
end
end
