defmodule AuctionWeb.PageController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.list_items()
    # items |> Kernel.inspect() |> IO.puts()
    render(conn, "index.html", items: items)
  end
end
