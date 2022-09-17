defmodule M do
    def main do
        do_stuff()
    end

    def do_stuff() do
      my_stats = {123, 4.56, :Pedro}
      IO.puts "Tuple #{is_tuple(my_stats)}"
      my_stats2 = Tuple.append(my_stats, 42)
      IO.puts "Age #{elem(my_stats2, 3)}"
      tuple_size(my_stats2) |> then(fn x -> "Size: #{x}" end) |> IO.puts
      my_stats3 = Tuple.delete_at(my_stats2, 2)
      my_stats4 = Tuple.insert_at(my_stats3, 0, 1988)
      many_zeros = Tuple.duplicate(0, 5)
      # Pattern Matching
      {weight, height, name} = {110, 1.85, "Pedro"}
      IO.puts "Weight: #{weight}, Height: #{height}, Name: #{name}"
    end
end
