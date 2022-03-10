defmodule MyappWeb.SessionView do

  use MyappWeb, :view
  def render("token.json", %{access_token: access_token}) do
    %{access_token: access_token}
  end
end
