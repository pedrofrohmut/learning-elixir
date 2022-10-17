defmodule Sum do
  def of(1), do: 1

  def of(n), do: n + of(n - 1)

  def main() do
    Enum.map(1..10, fn n -> of(n) end)
  end
end
