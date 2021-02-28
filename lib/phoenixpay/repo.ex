defmodule Phoenixpay.Repo do
  use Ecto.Repo,
    otp_app: :phoenixpay,
    adapter: Ecto.Adapters.Postgres
end
