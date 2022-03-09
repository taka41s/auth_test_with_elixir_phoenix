defmodule Myapp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :login, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:login, :password])
    |> validate_required([:login, :password])
    |> encrypt_and_put_password()
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:login, :password])
    |> validate_required([:login, :password])
  end

  defp encrypt_and_put_password(user) do
    with password <- fetch_field!(user, :password) do
      encrypted_password = Bcrypt.Base.hash_password(password, Bcrypt.gen_salt(12, true))
      put_change(user, :password, encrypted_password)
    end
  end
end
