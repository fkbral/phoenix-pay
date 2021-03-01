defmodule PhoenixpayWeb.UsersController do
  use PhoenixpayWeb, :controller

  alias Phoenixpay.User

  def create(connection, params) do
    params |> Phoenixpay.create_user() |> handle_response(connection)
  end

  defp handle_response({:ok, %User{} = user}, connection) do
    connection
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, result}, connection) do
    connection
    |> put_status(:bad_request)
    |> put_view(PhoenixpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
