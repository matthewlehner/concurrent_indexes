defmodule ConcurrentIndexesWeb.Router do
  use ConcurrentIndexesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConcurrentIndexesWeb do
    pipe_through :api
  end
end
