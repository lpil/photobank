defmodule BankWeb.Router do
  use BankWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", BankWeb do
    pipe_through :api

    resources "/feed", FeedController, only: [:show], singleton: true
    resources "/posts", PostController, only: [:create]
  end
end
