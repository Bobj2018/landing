defmodule Loor.Repo do
  use Ecto.Repo,
    otp_app: :loor,
    adapter: Ecto.Adapters.Postgres
end
