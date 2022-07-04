defmodule UserPosts.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :header, :string
    belongs_to :user, UserPosts.Users.User
    has_many :comments, UserPosts.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:header, :body, :user_id])
    |> validate_required([:header, :body, :user_id])
    |> unique_constraint([:id, :user_id])
  end
end
