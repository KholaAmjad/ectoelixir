defmodule UserPosts.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UserPosts.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        header: "some header"
      })
      |> UserPosts.Posts.create_post()

    post
  end
end
