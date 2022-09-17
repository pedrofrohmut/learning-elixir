defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff() do
    # Comprehension as a Map
    dbl_list = for n <- [1, 2, 3], do: n * 2
    IO.write "Double_List: "
    IO.inspect dbl_list

    # Comprehension as a Filter
    even_list = for n <- [1, 2, 3, 4], rem(n, 2) == 0, do: n
    IO.write "Even_List: "
    IO.inspect even_list
  end
end
