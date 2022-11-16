defmodule Conditionals do
  def main do
    # Single line if/else
    IO.puts if 1 == 1, do: "True Part", else: "False Part"
    IO.puts if 1 == 2, do: "True Part", else: "False Part"

    # Syntatic sugar if/else
    IO.puts(
      if 1 == 1 do
        "OK"
      else
        "Error"
      end
    )
  end
end

Conditionals.main()
