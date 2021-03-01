defmodule Phoenixpay.Users.Create do
  alias Phoenixpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
