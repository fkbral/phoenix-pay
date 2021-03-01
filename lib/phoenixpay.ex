defmodule Phoenixpay do
  alias Phoenixpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
