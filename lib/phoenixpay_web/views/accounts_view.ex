defmodule PhoenixpayWeb.AccountsView do
  alias Phoenixpay.{Account}

  def render("update.json", %{
        account: %Account{
          id: id,
          balance: balance
        }
      }) do
    %{
      message: "Deposit succeded",
      account: %{
        id: id,
        balance: balance
      }
    }
  end
end
