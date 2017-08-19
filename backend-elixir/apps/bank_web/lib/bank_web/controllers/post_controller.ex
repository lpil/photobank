defmodule BankWeb.PostController do
  use BankWeb, :controller

  alias Bank.{Feed, Feed.Post}

  action_fallback BankWeb.FallbackController

  def create(conn, %{"data" => post_params}) do
    with {:ok, %Post{} = post} <- Feed.create_post(post_params) do
      conn
      |> put_status(:created)
      |> render("show.json", post: post)
    end
  end
end
