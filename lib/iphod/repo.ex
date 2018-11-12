defmodule Iphod.Repo do
  use Ecto.Repo,
    otp_app: :iphod,
    adapter: Ecto.Adapters.Postgres

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
end
