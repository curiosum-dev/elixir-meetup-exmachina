defmodule Meetup.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Meetup.Repo

  # without Ecto
  # use ExMachina

  # ------------------ #
  # Accounts factories #
  # ------------------ #

  def user_factory do
    %Meetup.Accounts.User{
      name: "Joe Doe",
      email: "joe.doe@gmail.com",
      role: "admin"
    }
  end

  def user_company_factory do
    %Meetup.Accounts.User{
      name: "Joe Doe",
      email: "joe.doe@gmail.com",
      role: "admin",
      company: build(:company)
    }
  end

  def user_sequence_factory do
    build(:user, email: sequence(:email, &("joe.doe#{&1}@gmail.com")))
  end

  # ----------------------- #
  # Organizations factories #
  # ----------------------- #

  def company_factory do
    %Meetup.Organizations.Company{
      name: "CURIOSUM",
      email: "curiosum@gmail.com"
    }
  end

  def company_sequence_factory do
    build(:company, email: sequence(:email, &("curiosum#{&1}@gmail.com")))
  end
end
