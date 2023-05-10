defmodule Meetup.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Meetup.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        city: "some city",
        country: "some country",
        email: "some email",
        name: "some name",
        phone_number: "some phone_number",
        role: "some role"
      })
      |> Meetup.Accounts.create_user()

    user
  end
end
