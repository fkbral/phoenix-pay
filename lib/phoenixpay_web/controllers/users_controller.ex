defmodule PhoenixpayWeb.UsersController do
  use PhoenixpayWeb, :controller

  alias Phoenixpay.User

  action_fallback PhoenixpayWeb.FallbackController

  def create(connection, params) do
    with {:ok, %User{} = user} <- Phoenixpay.create_user(params) do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  # defp handle_response({:ok, %User{} = user}, connection) do
  #   connection
  #   |> put_status(:created)
  #   |> render("create.json", user: user)
  # end

  # defp handle_response({:error, _result} = error, _connection), do: error
end
