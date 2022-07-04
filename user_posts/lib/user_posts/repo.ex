defmodule UserPosts.Repo do
  use Ecto.Repo,
    otp_app: :user_posts,
    adapter: Ecto.Adapters.Postgres
end
