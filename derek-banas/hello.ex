defmodule M do
    def main do
        # Read std input
        name = IO.gets "What is your name? "  |> String.trim
        IO.puts "Hello #{name}"
    end
end
