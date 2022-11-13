defmodule Comprehensions do
  def main() do
    # Squares
    for x <- 1..5, do: x * x
    #=> [1, 4, 9, 16, 25]

    # Filtered Squares
    for x <- 1..5, x < 4, do: x * x
    #=> [1, 4, 9]

    # Two enumerables
    for x <- [1, 2], y <- [5, 6], do: x * y
    #=> [5, 6, 10, 12]

    # Two into tuples
    for x <- [1, 2], y <- [5, 6], do: {x, y}
    #=> [{1, 5}, {1, 6}, {2, 5}, {2, 6}]

    # With variables
    min_maxes = [{1, 4}, {2, 3}, {10, 15}]
    for {min, max} <- min_maxes, n <- min..max, do: n
    #=> [1, 2, 3, 4, 2, 3, 10, 11, 12, 13, 14, 15]

    # Complex comprehension with 2 collections and 2 filters
    for x <- 1..8, y <- 1..8, x >= y, rem(x * y, 10) == 0, do: { x, y }
    #=> [{5 , 2}, {5 , 4}, {6 , 5}, {8, 5}]

    # Keyword List
    reports = [dallas: "hot", minneapolis: "cold", dc: "muggy", la: "smoggy"]
    for { city, weather } <- reports, do: { city, weather }

    # With bits
    for << ch <- "Hello" >>, do: <<ch>>
    #=> ["H", "e", "l", "l", "o"]

    # The into: operator let you choose the return type of the comprehension
    for x <- ~w{ cat, dog }, into: %{}, do: { x, String.upcase(x) }
    #=> %{"cat" => "CAT", "dog" => "DOG"}

    # Can use Map.new to be more clear
    for x <- ~w{ cat, dog }, into: Map.new, do: { x, String.upcase(x) }
    #=> %{"cat" => "CAT", "dog" => "DOG"}

    # The into collection does not need to be empty
    for x <- ~w{ cat, dog }, into: %{"ant" => "ANT"}, do: { x, String.upcase(x) }
    #=> %{"ant" => "ANT", "cat" => "CAT", "dog" => "DOG"}
  end
end

Comprehensions.main()
