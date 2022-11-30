defmodule FizzBuzz1 do
  def main() do
    1..40
    |> Enum.each(fn x -> print_for(x) end)
  end

  def print_for(x) when rem(x, 15) == 0, do: IO.puts "#{x} Fizz Buzz"
  def print_for(x) when rem(x,  5) == 0, do: IO.puts "#{x} Buzz"
  def print_for(x) when rem(x,  3) == 0, do: IO.puts "#{x} Fizz"
  def print_for(x),                      do: IO.puts x
end

FizzBuzz1.main()
