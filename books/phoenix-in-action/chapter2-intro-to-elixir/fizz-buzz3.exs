defmodule FizzBuzz2 do
  def main(), do: 1..40 |> Enum.each(fn x -> print_for(x) end)

  def print_for(x) do
    case { rem(x, 3), rem(x, 5) } do
      { 0, 0 } -> IO.puts "#{x} FizzBuzz"
      { 0, _ } -> IO.puts "#{x} Fizz"
      { _, 0 } -> IO.puts "#{x} Buzz"
      _        -> IO.puts x
    end
  end
end

FizzBuzz2.main()
