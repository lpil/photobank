defmodule BankWeb.FeedView do
  use BankWeb, :view
  alias BankWeb.PostView

  def render("show.json", %{posts: posts}) do
    %{
      data: %{
        items: render_many(posts, PostView, "post.json")
      }
    }
  end
end
