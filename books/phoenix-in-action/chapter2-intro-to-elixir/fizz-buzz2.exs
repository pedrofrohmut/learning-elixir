defmodule FizzBuzz2 do
  def main() do
    1..40 |> Enum.each(fn x -> print_for(x) end)
  end

  def print_for(x) do
    cond do
      rem(x, 15) == 0 -> IO.puts "#{x} Fizz Buzz"
      rem(x,  5) == 0 -> IO.puts "#{x} Buzz"
      rem(x,  3) == 0 -> IO.puts "#{x} Fizz"
      true            -> IO.puts x
    end
  end
end

FizzBuzz2.main()
