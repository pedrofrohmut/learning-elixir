defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff() do
    IO.puts "Factorial of 5: #{factorial(5)}"

    IO.puts "Sum: #{sum([1, 2, 3, 4, 5])}"

    loop(5, 1)
  end

  # Elixir always return the last line of the function without the need of the return keyword
  def factorial(n) do
    # recursion break codition (without it goes to infinite calculation)
    if n <= 1 do
      1
    else
      n * factorial(n - 1)
    end
  end

  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

  def loop(0, _), do: nil
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num: #{max}"
      loop(max - 1, min)
    end
  end
end
