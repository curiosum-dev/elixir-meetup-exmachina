defmodule Meetup.UserFactories do
  defmacro __using__(_opts) do
    quote do
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
    end
  end
end
