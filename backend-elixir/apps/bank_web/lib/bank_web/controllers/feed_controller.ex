defmodule BankWeb.FeedController do
  use BankWeb, :controller
  alias Bank.Feed

  action_fallback BankWeb.FallbackController

  def show(conn, _params) do
    posts = Feed.list_posts()
    render(conn, "show.json", posts: posts)
  end
end
