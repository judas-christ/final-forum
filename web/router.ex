defmodule FinalForum.Router do
  use FinalForum.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FinalForum do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:topic_id", PageController, :topic
    get "/:topic_id/reply", PageController, :reply

    resources "/topics", TopicController
    resources "/posts", PostController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FinalForum do
  #   pipe_through :api
  # end
end
