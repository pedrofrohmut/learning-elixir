defmodule M do
  def main() do
    fizz_buzz(1, 100)
  end

  def fizz_buzz(min, max) do
    min..max
    |> Enum.each(fn n -> fizz_buzz(n) end)
  end

  def fizz_buzz(n) when rem(n, 15) == 0, do: IO.puts "#{n} FizzBuzz"

  def fizz_buzz(n) when rem(n, 5)  == 0, do: IO.puts "#{n} Buzz"

  def fizz_buzz(n) when rem(n, 3)  == 0, do: IO.puts "#{n} Fizz"

  def fizz_buzz(n), do: IO.puts n
end
