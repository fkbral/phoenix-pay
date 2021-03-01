defmodule PhoenixpayWeb.AccountsController do
  use PhoenixpayWeb, :controller

  alias Phoenixpay.Account

  action_fallback PhoenixpayWeb.FallbackController

  def deposit(connection, params) do
    with {:ok, %Account{} = account} <- Phoenixpay.deposit(params) do
      connection
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  def withdraw(connection, params) do
  end
end
