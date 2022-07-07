defmodule UserPostsWeb.UserController do
  use UserPostsWeb, :controller

  alias UserPosts.Users

  def index(conn, _params) do
      users = Users.list_users()
      conn
      |> render("index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    users = Users.get_user!(id)
    conn
    |> render("show.json", users: users)
  end

  def create(conn, %{"name" => _, "email" => _} = user_params) do
    case Users.create_user(user_params) do
      {:ok, users} ->
        conn
        |> render("index.json", users: users)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("error.json", changeset: changeset)
    end
  end

  def create(conn, params) do
    IO.inspect(params)
    conn
    |> send_resp(400, "Incorrect Params")
    |> halt()
  end

  def update(conn, %{"id" => id, "user" => _} = user_params) do
    users = Users.get_user!(id)
    case Users.update_user(users, user_params) do
      {:ok, _user} ->

        conn
        |> render("show.json", users: users)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("error.json", changeset: changeset)
    end
  end

  def update(conn, params) do
    IO.inspect(params)
    conn
    |> send_resp(400, "Incorrect Params")
    |> halt()
  end

  def delete(conn, %{"id" => id}) do
    case Users.delete_user(id) do
      {:ok, _user} ->
        users = Users.list_users()
        conn
        |> render("index.json", users: users)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("error.json", changeset: changeset)
    end
  end

  def delete(conn, params) do
    IO.inspect(params)
    conn
    |> send_resp(400, "Incorrect Params")
    |> halt()
  end
end
