defmodule Api.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_api_v2,
    adapter: Ecto.Adapters.Postgres
end
