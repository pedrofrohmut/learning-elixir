defmodule Auction do
    alias Auction.{ FakeRepo, Item } # Alias severeal modules at once

    @repo FakeRepo

    def list_items(), do: @repo.all(Item)

    def get_item(id), do: @repo.get!(Item, id)

    def get_item_by(attrs), do: @repo.get_by(Item, attrs)
end
