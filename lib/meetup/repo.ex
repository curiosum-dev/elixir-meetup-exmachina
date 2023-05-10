defmodule Meetup.Repo do
  use Ecto.Repo,
    otp_app: :meetup,
    adapter: Ecto.Adapters.Postgres
end
