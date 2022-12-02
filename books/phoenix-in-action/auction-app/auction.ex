defmodule Auction.Item do
    defstruct [:id, :title, :description, :ends_at]
end

defmodule Auction.FakeRepo do
    alias Auction.Item

    @items [
        %Item{
            id: 1,
            title: "My First Item",
            description: "A tasty item sure to please",
            ends_at: ~N[2020-01-01 00:00:00]
        },
        %Item{
            id: 2,
            title: "Wargames Bluray",
            description: "The best computer movie of all time, now on blueray",
            ends_at: ~N[2018-10-15 13:39:35]
        },
        %Item{
            id: 3,
            title: "U2 - Achtung Baby on CD",
            description: "The sound of 4 men chopping down The Joshua Tree",
            ends_at: ~N[2018-11-05 03:12:29]
        }
    ]

    def all(Item), do: @items

    def get!(Item, id), do: Enum.find(@items, fn item -> item.id === id end)

    def get_by(Item, attrs) do
        # Enum.find(@items, fn item ->
        #     Enum.all?(Map.keys(attrs), fn key ->
        #         Map.get(item, key) === attrs[key]
        #     end)
        # end)
        Enum.find(@items, fn item -> item_matches_all_attrs?(item, attrs) end)
    end

    defp item_matches_all_attrs?(item, attrs) do
        keys = Map.keys(attrs)
        Enum.all?(keys, fn key -> Map.get(item, key) === attrs[key] end)
    end
end

defmodule Auction do
    alias Auction.{ FakeRepo, Item } # Alias severeal modules at once

    @repo FakeRepo

    def list_items(), do: @repo.all(Item)

    def get_item(id), do: @repo.get!(Item, id)

    def get_item_by(attrs), do: @repo.get_by(Item, attrs)
end
