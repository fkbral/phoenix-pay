defmodule PhoenixpayWeb.AccountsController do
  use PhoenixpayWeb, :controller

  alias Phoenixpay.Account
  alias Phoenixpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback PhoenixpayWeb.FallbackController

  def deposit(connection, params) do
    with {:ok, %Account{} = account} <- Phoenixpay.deposit(params) do
      connection
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  def withdraw(connection, params) do
    with {:ok, %Account{} = account} <- Phoenixpay.withdraw(params) do
      connection
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end

  def transaction(connection, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Phoenixpay.transaction(params) do
      connection
      |> put_status(:created)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
