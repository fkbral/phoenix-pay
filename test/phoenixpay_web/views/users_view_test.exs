defmodule PhoenixpayWeb.UsersViewTest do
  use PhoenixpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Phoenixpay.{User, Account}
  alias PhoenixpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "John",
      password: "123456",
      nickname: "doe",
      email: "john@test.com",
      age: 20
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Phoenixpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "John",
        nickname: "doe"
      }
    }

    assert expected_response == response
  end
end
