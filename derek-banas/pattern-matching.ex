defmodule M do
    def main do
        do_stuff()
    end

    def do_stuff() do
      [length, width] = [20, 30]
      IO.puts "Width: #{width}"
      # Use underscores for the values you want to ignore
      [_, [_, a]] = [20, [30, 40]]
      IO.puts "Get num: #{a}"
    end
 end
