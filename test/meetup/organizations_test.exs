defmodule Meetup.OrganizationsTest do
  use Meetup.DataCase

  alias Meetup.Organizations

  describe "companies" do
    alias Meetup.Organizations.Company

    import Meetup.OrganizationsFixtures

    @invalid_attrs %{city: nil, country: nil, date_of_cration: nil, email: nil, name: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Organizations.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Organizations.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{city: "some city", country: "some country", date_of_cration: ~N[2023-05-09 14:04:00], email: "some email", name: "some name"}

      assert {:ok, %Company{} = company} = Organizations.create_company(valid_attrs)
      assert company.city == "some city"
      assert company.country == "some country"
      assert company.date_of_cration == ~N[2023-05-09 14:04:00]
      assert company.email == "some email"
      assert company.name == "some name"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{city: "some updated city", country: "some updated country", date_of_cration: ~N[2023-05-10 14:04:00], email: "some updated email", name: "some updated name"}

      assert {:ok, %Company{} = company} = Organizations.update_company(company, update_attrs)
      assert company.city == "some updated city"
      assert company.country == "some updated country"
      assert company.date_of_cration == ~N[2023-05-10 14:04:00]
      assert company.email == "some updated email"
      assert company.name == "some updated name"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_company(company, @invalid_attrs)
      assert company == Organizations.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Organizations.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Organizations.change_company(company)
    end

    # --------------- #
    # Factories tests #
    # --------------- #

    test "company_factory" do
      company = insert(:company, country: "POLAND")
      IO.inspect(company, label: "company")
      companies = Meetup.Repo.all(Meetup.Organizations.Company)
      IO.inspect(companies, label: "companies")
    end

    test "company_sequence_factory" do
      company_1 = insert(:company_sequence)
      company_2 = insert(:company_sequence)
      company_3 = insert(:company_sequence)
      company_4 = insert(:company_sequence)

      IO.inspect(binding(), label: "companies!")
    end
  end
end
