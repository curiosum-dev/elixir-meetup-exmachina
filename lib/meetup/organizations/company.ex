defmodule Meetup.Organizations.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :city, :string
    field :country, :string
    field :date_of_creation, :naive_datetime
    field :email, :string
    field :name, :string
    has_many :users, Meetup.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :country, :city, :date_of_creation, :email])
    |> validate_required([:name, :email])
  end
end
