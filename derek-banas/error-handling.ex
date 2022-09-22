defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff() do
    err = try do
      5/0
    rescue
      ArithmeticError -> "Cannot devide by zero"
    end
    IO.puts err
  end
end
