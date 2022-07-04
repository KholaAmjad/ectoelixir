defmodule UserPosts.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UserPosts.Users` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        name: "some name"
      })
      |> UserPosts.Users.create_user()

    user
  end
end