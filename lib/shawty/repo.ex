defmodule Shawty.Repo do
  use Ecto.Repo,
    otp_app: :shawty,
    adapter: Ecto.Adapters.Postgres
end
