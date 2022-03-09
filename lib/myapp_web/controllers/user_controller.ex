defmodule MyappWeb.UserController do
  use MyappWeb, :controller

  alias Myapp.Accounts
  alias Myapp.Accounts.User

  def register(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> text("User created." <> " " <> user.email)
    end
  end
end
