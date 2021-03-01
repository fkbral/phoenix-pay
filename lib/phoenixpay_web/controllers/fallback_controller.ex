defmodule PhoenixpayWeb.FallbackController do
  use PhoenixpayWeb, :controller

  def call(connection, {:error, result}) do
    connection
    |> put_status(:bad_request)
    |> put_view(PhoenixpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
