defmodule Datagit.Repo do
  use Ecto.Repo,
    otp_app: :datagit,
    adapter: Ecto.Adapters.Postgres
end
