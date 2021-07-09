defmodule DatagitWeb.PageController do
  use DatagitWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
