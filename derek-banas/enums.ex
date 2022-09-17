defmodule M do
  def main do
    do_stuff()
  end

  def are_all_even(list) do
    Enum.all?(list, fn x -> rem(x,  2) == 0 end)
  end

  def are_any_even(list), do: Enum.any?(list, fn x -> rem(x, 2) == 0 end)

  def do_stuff() do
    list1 = [1, 2, 3]
    IO.puts "all evens? #{are_all_even(list1)}"
    IO.puts "any evens? #{are_any_even(list1)}"

    # For each
    Enum.each(list1, fn x -> IO.puts x end)
    # With short hand
    Enum.each(list1, &(IO.puts &1))

    # Map
    double_list = Enum.map(list1, fn x -> x * 2 end)
    IO.write "Double of: "
    IO.inspect list1
    IO.write "Is: "
    IO.inspect double_list

    # Reduce
    sum = Enum.reduce(list1 ++ [4, 5, 6], fn (curr, acc) -> curr + acc end)
    IO.puts "Sum: #{sum}"

    # Unique
    IO.inspect Enum.uniq([1,2,3,4,2,3,1,2,3,5])
  end
end
