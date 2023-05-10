defmodule Meetup.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :city, :string
    field :country, :string
    field :email, :string
    field :name, :string
    field :phone_number, :string
    field :role, :string
    belongs_to :company, Meetup.Organizations.Company

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :email, :phone_number, :country, :city, :role])
    |> validate_required([:name, :email])
  end
end
