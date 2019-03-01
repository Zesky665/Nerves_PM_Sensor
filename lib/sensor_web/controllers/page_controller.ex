defmodule SensorWeb.PageController do
  use SensorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
