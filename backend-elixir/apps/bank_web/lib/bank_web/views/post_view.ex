defmodule BankWeb.PostView do
  use BankWeb, :view

  def render("post.json", %{post: post}) do
    post
    |> Map.take(~w(id text)a)
    |> Map.put(:type, "post")
  end
end
