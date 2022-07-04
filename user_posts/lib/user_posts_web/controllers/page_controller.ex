defmodule UserPostsWeb.PageController do
  use UserPostsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
