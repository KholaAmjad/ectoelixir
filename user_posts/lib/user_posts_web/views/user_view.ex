defmodule UserPostsWeb.UserView do
  use UserPostsWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserPostsWeb.UserView, "user.json")}
  end

  def render("user.json", %{users: users}) do
    %{name: users.name, email: users.email, id: users.id}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UserPostsWeb.UserView, "user.json")}
  end

  def render("error.json", %{changeset: changeset}) do
    %{errors: get_errors(changeset)}
  end

  def get_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &get_errors/1)
  end
end
