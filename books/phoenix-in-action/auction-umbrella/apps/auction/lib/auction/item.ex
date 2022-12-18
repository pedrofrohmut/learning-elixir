defmodule Auction.Item do
    # defstruct [:id, :title, :description, :ends_at]

    use Ecto.Schema

    import Ecto.Changeset

    schema "items" do
        field    :title,       :string
        field    :description, :string
        field    :ends_at,     :utc_datetime
        has_many :bids,        Auction.Bid
        timestamps() # Adds inserted_at and updated_at columns
    end

    def changeset(item, params \\ %{}) do
        item
        |> cast(params, [:title, :description, :ends_at]) # Limits which fields can be updated
        |> validate_required(:title)
        |> validate_length(:title, min: 3)
        |> validate_length(:description, max: 200)
        |> validate_change(:ends_at, &validate_ends_at/2)
    end

    defp validate_ends_at(_atom, value) do
        case DateTime.compare(value, DateTime.utc_now()) do
            # :lt - Less Than
            :lt -> [ends_at: "ends_at cannot be in the past"]
            _   -> []
        end
    end
end
