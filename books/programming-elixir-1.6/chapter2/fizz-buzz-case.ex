defmodule MCase do
  def main() do
    fizz_buzz(1, 30)
  end

  def fizz_buzz(min, max) do
    Enum.each(min..max, fn n -> fizz_buzz(n) end)
  end

  def fizz_buzz(n) do
    rest_tuple = { rem(n, 5), rem(n, 3) }
    case rest_tuple do
      { 0, 0 } -> IO.puts "FizzBuzz"
      { 0, _ } -> IO.puts "Buzz"
      { _, 0 } -> IO.puts "Fizz"
      _        -> IO.puts n
    end
  end
end
