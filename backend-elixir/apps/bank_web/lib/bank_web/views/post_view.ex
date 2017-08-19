defmodule BankWeb.PostView do
  use BankWeb, :view

  @post_attrs ~w(id text)a

  def render("show.json", %{post: _} = data) do
    %{post: render("post.json", data)}
  end

  def render("post.json", %{post: post}) do
    post
    |> Map.take(@post_attrs)
    |> Map.put(:type, "post")
  end
end
