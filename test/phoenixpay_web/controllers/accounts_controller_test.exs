defmodule PhoenixpayWeb.AccountsControllerTest do
  use PhoenixpayWeb.ConnCase, async: true

  alias Phoenixpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "John",
        password: "123456",
        nickname: "doe",
        email: "john@test.com",
        age: 20
      }

      {:ok, %User{account: %Account{id: account_id}}} = Phoenixpay.create_user(params)

      {:ok, conn: conn, account_id: account_id}
    end

    test "with valid params, make a deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> put_req_header("authorization", "Basic YWRtaW46MTIzNDU2")
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:created)

      assert %{
               "account" => %{
                 "balance" => "50.00",
                 "id" => _id
               },
               "message" => "Balance updated succesfully"
             } = response
    end

    test "with invalid params, returns an error", %{
      conn: conn,
      account_id: account_id
    } do
      params = %{"value" => "invalid value"}

      response =
        conn
        |> put_req_header("authorization", "Basic YWRtaW46MTIzNDU2")
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
