import Enum
# import IO
# import Kernel

defmodule CardDeck do
  def main() do
    deck = for rank <- 'A23456789TJQK', suit <- 'CDHS', do: [suit, rank]
    # Shuffles and takes the first 13 elements
    hand1 = deck |> Enum.shuffle |> Enum.take(13)
    # Shuffles and chunks the list into chunks (smaller lists) of 13 elements
    hands = deck |> shuffle |> chunk_every(13)
  end
end

CardDeck.main()
