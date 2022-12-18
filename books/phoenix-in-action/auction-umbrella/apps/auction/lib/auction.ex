defmodule Auction do
    alias Auction.{ Bid, Repo, Item, User, Password }

    @repo Repo

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

    def get_user(id), do: @repo.get!(User, id)

    def new_user(), do: User.changeset_with_password(%User{})

    def insert_user(params) do
        %User{}
        |> User.changeset_with_password(params)
        |> @repo.insert()
    end

    def get_user_by_username_and_password(username, password) do
        user = @repo.get_by(User, %{ username: username })
        if is_nil(user), do: nil, else: (
            case Password.verify_with_hash(password, user.password_hash) do
                true  -> user
                false -> nil
            end
        )
    end

    def insert_bid(params), do: Bid.changeset(%Bid{}, params) |> @repo.insert()

    def new_bid(), do: Bid.changeset(%Bid{})
end
