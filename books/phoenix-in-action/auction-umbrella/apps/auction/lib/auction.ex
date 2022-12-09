defmodule Auction do
    alias Auction.Item

    @repo Auction.Repo

    def list_items(), do: @repo.all(Item)

    def get_item(id), do: @repo.get!(Item, id)

    def get_item_by(attrs), do: @repo.get_by(Item, attrs)

    def new_item(), do: Item.changeset(%Item{})

    def insert_item(attrs), do: %Item{} |> Item.changeset(attrs) |> @repo.insert()

    # Use '%Auction.Item', using pattern matching, to make sure you are passing and item
    # and don't delete a row from another table by mistake
    def delete_item(%Auction.Item{} = item), do: @repo.delete(item)

    def edit_item(id), do: @repo.get!(Item, id) |> Item.changeset()

    def update_item(%Auction.Item{} = item, updates) do
        item |> Item.changeset(updates) |> @repo.update()
    end
end
