defmodule Meetup.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :phone_number, :string
      add :country, :string
      add :city, :string
      add :role, :string
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:company_id])
  end
end
