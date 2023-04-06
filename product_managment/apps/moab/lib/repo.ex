defmodule Moab.Repo do
  use Ecto.Repo,
    otp_app: :moab,
    adapter: Ecto.Adapters.Postgres
end
