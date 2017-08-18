defmodule Bank.Feed do
  @moduledoc """
  The Feed context.

  """
  import Ecto.Query, warn: false
  alias Bank.Repo

  alias Bank.Feed.Post

  @doc """
  Returns the list of posts.

  """
  def list_posts do
    Repo.all(Post)
  end


  @doc """
  Creates a post.

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end
end
