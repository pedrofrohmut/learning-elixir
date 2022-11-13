defmodule FizzBuzz do
  def main() do
    fizz_buzz(1, 100)
  end

  def fizz_buzz(min, max) do
    numbers = (min..max)
    Enum.each(numbers, fn x -> fizz_buzz(x) end)
  end

  def fizz_buzz(n) do
    cond do
      rem(n, 15) == 0.0 -> IO.puts "#{n} FizzBuzz"
      rem(n, 3)  == 0.0 -> IO.puts "#{n} Fizz"
      rem(n, 5)  == 0.0 -> IO.puts "#{n} Buzz"
      true              -> IO.puts n
    end
  end
end
