defmodule LoorWeb.LandingController do
  use LoorWeb, :controller


  import Ecto.Query

  alias Loor.{Landing, Repo, Email}


  def index(conn, _params) do
    landings = Repo.all(Landing)

    render conn, "index.html", landings: landings
  end

  def emails(conn, %{"id" => landing_id}) do
    emails = Email |> where(landing_id: ^landing_id) |> Repo.all

    render conn, "emails.html", emails: emails
  end

  def show(conn, %{"id" => landing_id}) do
    landing = Repo.get(Landing, landing_id)
    changeset = Email.changeset(%Email{}, %{})

    render conn, "show.html", changeset: changeset, landing: landing
  end

  def view(conn, %{"slug" => slug}) do
    [%Landing{} = landing] = Landing |> where(slug: ^slug) |> Repo.all
    changeset = Email.changeset(%Email{}, %{})

    render conn, "show.html", changeset: changeset, landing: landing
  end

  def new(conn, _params) do
    changeset = Landing.changeset(%Landing{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"landing" => landing}) do
    changeset = Landing.changeset(%Landing{}, landing)

    case Repo.insert(changeset) do
      {:ok, _landing} ->
        conn
        |> put_flash(:info, "Landing Created")
        |> redirect(to: Routes.landing_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => landing_id}) do
    landing = Repo.get(Landing, landing_id)
    changeset = Landing.changeset(landing)

    render conn, "edit.html", changeset: changeset, landing: landing
  end

  def update(conn, %{"landing" => landing, "id" => landing_id}) do
    current_landing = Repo.get(Landing, landing_id)
    changeset = Landing.changeset(current_landing, landing)

    case Repo.update(changeset) do
      {:ok, _landing} ->
        conn
        |> put_flash(:info, "Landing Updated")
        |> redirect(to: Routes.landing_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, landing: current_landing
    end
  end



  def delete(conn, %{"id" => landing_id}) do
    Repo.get!(Landing, landing_id)
    |> Repo.delete!

    conn
    |> put_flash(:info, "Landing Deleted")
    |> redirect(to: Routes.landing_path(conn, :index))

  end

end
