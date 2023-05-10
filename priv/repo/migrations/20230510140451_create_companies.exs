defmodule Meetup.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :country, :string
      add :city, :string
      add :date_of_creation, :naive_datetime
      add :email, :string

      timestamps()
    end
  end
end
