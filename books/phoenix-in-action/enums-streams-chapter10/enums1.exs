require Integer

defmodule Enums1 do
  def main() do
    # Convert any collection into a list
    list = Enum.to_list(1..5)

    # Concat collections
    Enum.concat([1, 2, 3], [4, 5, 6])
    Enum.concat([1, 2, 3], 'abc')

    # Map the elements with a function
    Enum.map(list, fn x -> x * 10 end)
    Enum.map(list, fn x -> String.duplicate("*", x) end)

    # Select elements by position
    Enum.at(10..20, 3)
    Enum.at(10..20, 20)
    Enum.at(10..20, 20, :no_one_here)

    # Filter by codition (reject is the oposite of filter)
    Enum.filter(10..20, fn x -> x > 5 end)
    Enum.filter(list, fn x -> Integer.is_even(x) end)
    #Enum.reject(list, fn x -> Integer.is_even(x) end)
    Enum.reject(list, &Integer.is_even/1)

    # Sort
    str_list = ["there", "was", "a", "crooked", "man"]
    Enum.sort(str_list)
    Enum.sort(str_list, fn a, b -> String.length(a) <= String.length(b) end)
    #Enum.sort(str_list, &(String.length(&1) <= String.length(&2)))

    # Compare
    Enum.max(str_list)
    Enum.max_by(str_list, &String.length/1)

    # Split a collection
    Enum.take(list, 3)
    Enum.take_every(list, 2)
    Enum.take_while(list, fn n -> n < 4 end)
    Enum.split(list, 3)
    Enum.split_while(list, &(&1 < 5))

    # Join a collection
    Enum.join(list)
    Enum.join(list, ", ")

    # Predicate Operations
    Enum.all?(list, fn n -> n < 4 end)
    Enum.any?(list, fn n -> n < 4 end)
    Enum.member?(list, 4)
    Enum.empty?(list)

    # Merge Collections
    Enum.zip(list, [:a, :b, :c])
    Enum.with_index(["once", "upon", "the", "time"])

    # Reduce
    Enum.reduce(1..100, 0, fn x, acc -> acc + x end)
    Enum.reduce(["now", "is", "the", "time"],
      fn word, longest ->
        if String.length(word) > String.length(longest), do: word, else: longest
      end)
    Enum.reduce(["now", "is", "the", "time"], 0,
      fn curr, acc -> if String.length(curr) > acc, do: String.length(curr), else: acc end)
  end
end

Enums1.main()
