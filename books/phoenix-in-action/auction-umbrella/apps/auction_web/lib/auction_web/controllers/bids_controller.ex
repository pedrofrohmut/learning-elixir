defmodule Auciton.BidsController do
    use AuctionWeb, :controller

    plug :require_logged_in_user

    defp require_logged_in_user(%{ assigns: %{ current_user: nil } } = conn, _opts) do
        conn
        |> put_flash(:error, "You must be logged in to bid")
        |> redirect(to: Routes.items_path(conn, :index))
        |> halt()
    end

    defp require_logged_in_user(conn, _opts), do: conn

    def create(conn, %{ "bid" => %{ "amount" => amount }, "item_id" => item_id }) do
        user_id = conn.assigns.current_user.id
        case Auction.insert_bid(%{ amount: amount, item_id: item_id, user_id: user_id }) do
            { :ok,    bid } ->
                redirect(conn, to: Routes.items_path(conn, :show, bid.item_id))
            { :error, bid } ->
                item = Auction.get_item(item_id)
                render(conn, AuctionWeb.ItemView, "show.html", item: item, bid: bid)
        end
    end
end
