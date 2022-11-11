require Integer

defmodule Streams do
  def pipeline() do
    1..5
      |> Enum.map(fn n -> n * n end)
      |> Enum.with_index
      |> Enum.map(fn {value, index} -> value - index end)
      |> Kernel.inspect
      |> IO.puts
  end

  def longest_line() do
    File.read!("/usr/share/dict/words")
      |> String.split
      |> Enum.max_by(&String.length/1)
  end

  def main() do
    # Example 1
    # Streams are lazy and only processed when Enum.to_list is called
    [1, 3, 5, 7]
      |> Stream.map(fn n -> n + 1 end)
      |> Enum.to_list
      |> Kernel.inspect
      |> IO.puts

    # Example 2
    # With the laziness of streams you can than process just a part of the stream
    # different for Enum.map that always apply function to the collection the moment it is called
    1..100
      |> Stream.map(fn n -> n * n end)
      |> Stream.map(fn n -> n + 1 end)
      |> Stream.filter(fn n -> Integer.is_odd(n) end)
      # This could be like a pagination with a list of 2 million posts you can take only 10 for example
      |> Enum.take(3)
      |> Kernel.inspect
      |> IO.puts
  end
end

Streams.main()
