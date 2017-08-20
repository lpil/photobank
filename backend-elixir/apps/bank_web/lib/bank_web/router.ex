defmodule BankWeb.Router do
  use BankWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", BankWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/v1", BankWeb do
    pipe_through :api

    resources "/feed", FeedController, only: [:show], singleton: true
    resources "/posts", PostController, only: [:create]
  end
end
