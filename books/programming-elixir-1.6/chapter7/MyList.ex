defmodule MyList do
  def len([]), do: 0
  def len([ _head | tail ]), do: 1 + len(tail)

  def map([]), do: []
  def map([head|tail]), do: [head * head | map(tail)]

  def sum([n]), do: n
  def sum([head|tail]), do: head + sum(tail)

  def mapsum([]), do: 0
  def mapsum([head|tail]), do: (head * head) + mapsum(tail)

  def mapsum([], _func), do: 0
  def mapsum([head|tail], func), do: func.(head) + mapsum(tail, func)

  def list_max([x]), do: x
  def list_max([x, y | tail]), do: list_max([max(x, y) | tail])

  def ceaser([], _n), do: []
  def ceaser([head|tail], n), do: [head + n | ceaser(tail, n)]
end
