defmodule Phoenixpay do
  alias Phoenixpay.Users.Create, as: UserCreate
  alias Phoenixpay.Accounts.{Deposit, Transaction, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
