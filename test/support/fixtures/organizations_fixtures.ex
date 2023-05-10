defmodule Meetup.OrganizationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Meetup.Organizations` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        city: "some city",
        country: "some country",
        date_of_cration: ~N[2023-05-09 14:04:00],
        email: "some email",
        name: "some name"
      })
      |> Meetup.Organizations.create_company()

    company
  end
end
