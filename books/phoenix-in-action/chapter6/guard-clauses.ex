defmodule GuardClause do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end

  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end

  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end

  def main() do
    GuardClause.what_is(420)
    GuardClause.what_is(:cat)
    GuardClause.what_is([1, 2, 3])
  end
end
