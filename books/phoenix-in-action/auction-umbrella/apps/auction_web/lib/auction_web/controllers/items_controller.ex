defmodule AuctionWeb.ItemsController do
    use AuctionWeb, :controller

    def index(conn, _params) do
        items = Auction.list_items()
        render(conn, "index.html", items: items)
    end

    def show(conn, %{ "id" => id }) do
        item = Auction.get_item(id)
        bid = Auction.new_bid()
        render(conn, "show.html", item: item, bid: bid)
    end

    def new(conn, _params) do
        item = Auction.new_item()
        render(conn, "new.html", item: item)
    end

    def create(conn, %{ "item" => item_params }) do
        case Auction.insert_item(item_params) do
            { :ok,    item } -> redirect(conn, to: Routes.items_path(conn, :show, item))
            { :error, item } -> render(conn, "new.html", item: item)
        end
    end

    def edit(conn, %{ "id" => id }) do
        item = Auction.edit_item(id)
        render(conn, "edit.html", item: item)
    end

    def update(conn, %{ "id" => id, "item" => updates }) do
        item = Auction.get_item(id)
        case Auction.update_item(item, updates) do
            { :ok,    item } -> redirect(conn, to: Routes.items_path(conn, :show, item))
            { :error, item } -> render(conn, "edit.html", item: item)
        end
    end
end
