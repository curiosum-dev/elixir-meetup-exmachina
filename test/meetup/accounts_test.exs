defmodule Meetup.AccountsTest do
  use Meetup.DataCase

  alias Meetup.Accounts

  describe "users" do
    alias Meetup.Accounts.User
    import Meetup.AccountsFixtures
    import Meetup.Factory

    @invalid_attrs %{age: nil, city: nil, country: nil, email: nil, name: nil, phone_number: nil, role: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{age: 42, city: "some city", country: "some country", email: "some email", name: "some name", phone_number: "some phone_number", role: "some role"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.age == 42
      assert user.city == "some city"
      assert user.country == "some country"
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.phone_number == "some phone_number"
      assert user.role == "some role"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{age: 43, city: "some updated city", country: "some updated country", email: "some updated email", name: "some updated name", phone_number: "some updated phone_number", role: "some updated role"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.age == 43
      assert user.city == "some updated city"
      assert user.country == "some updated country"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.phone_number == "some updated phone_number"
      assert user.role == "some updated role"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end

    # --------------- #
    # Factories tests #
    # --------------- #

    test "insert_user" do
      user = insert(:user, role: "user", phone_number: "123123123")
      IO.inspect(user, label: "user")
      users = Meetup.Repo.all(Meetup.Accounts.User)
      IO.inspect(users, label: "users")
    end

    test "build_user" do
      user = build(:user)
      IO.inspect(user, label: "user")
      users = Meetup.Repo.all(Meetup.Accounts.User)
      IO.inspect(users, label: "users")
    end

    test "user_company_factory" do
      user = insert(:user_company)
      # IO.inspect(user, label: "user")
      users = Meetup.Repo.all(Meetup.Accounts.User)
      IO.inspect(users, label: "users")
    end

    test "user_sequence_factory" do
      user_1 = insert(:user_sequence)
      user_2 = insert(:user_sequence)
      user_3 = insert(:user_sequence)
      user_4 = insert(:user_sequence)
    end

    test "string_params_for" do
      user = string_params_for(:user)
      IO.inspect(user, label: "user")
    end
  end
end
