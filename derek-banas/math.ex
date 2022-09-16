defmodule M do
    def main do
        do_stuff()
    end

    def do_stuff() do
        "5 + 4   = #{5 + 4}"     |> IO.puts
        "5 - 4   = #{5 - 4}"     |> IO.puts
        "5 * 4   = #{5 * 4}"     |> IO.puts
        "5 / 4   = #{5 / 4}"     |> IO.puts
        # Calculates the integer division
        "5 div 4 = #{div(5, 4)}" |> IO.puts
        # Gets the reminder of the integer divison (like % in C)
        "5 rem 4 = #{rem(5, 4)}" |> IO.puts


        IO.puts "4 == 4.0  ? #{4 == 4.0}"
        IO.puts "4 === 4.0 ? #{4 === 4.0}"
        IO.puts "4 != 4.0  ? #{4 != 4.0}"
        IO.puts "4 !== 4.0 ? #{4 !== 4.0}"
    end
end
