defmodule Phoenixpay.Users.CreateTest do
  use Phoenixpay.DataCase, async: true

  alias Phoenixpay.User
  alias Phoenixpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "John",
        password: "123456",
        nickname: "doe",
        email: "john@test.com",
        age: 20
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "John", age: 20, id: ^user_id} = user
    end

    test "with invalid params, returns an error" do
      params = %{
        name: "John",
        nickname: "doe",
        email: "john@test.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
