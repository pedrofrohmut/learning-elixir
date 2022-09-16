defmodule M do
    def main do
        do_stuff()
    end

    def do_stuff() do
        # Elixir compares like JavaScript where 2 equal compare value
        # but 3 equals compares the tyoe too
        "-------------------------------------------" |> IO.puts
        "- 2 and 3 equals" |> IO.puts
        IO.puts "4 ==  4.0 ? #{4 == 4.0}"
        IO.puts "4 === 4.0 ? #{4 === 4.0}"
        IO.puts "4 !=  4.0 ? #{4 != 4.0}"
        IO.puts "4 !== 4.0 ? #{4 !== 4.0}"

        "-------------------------------------------" |> IO.puts
        "- Less than and Greater than" |> IO.puts
        "5 <  4 ? #{5 < 4}"  |> IO.puts
        "5 <= 4 ? #{5 <= 4}" |> IO.puts
        "5 >  4 ? #{5 > 4}"  |> IO.puts
        "5 >= 4 ? #{5 >= 4}" |> IO.puts

        "-------------------------------------------" |> IO.puts
        "- Logical operators" |> IO.puts
        age = 34
        "Age is #{age}" |> IO.puts
        (age >= 16 and age <= 70) |> then(fn x -> "Can drive? #{x}" end) |> IO.puts
        (age >= 18 and age <= 60) |> then(&"Can vote?  #{&1}") |> IO.puts

        # Not operator is 'not'
        IO.puts "is true ? #{not false}"


        "-------------------------------------------" |> IO.puts
        "IFS" |> IO.puts
        if age >= 21 do
            IO.puts "Can Drink Alcohol"
        end

        if age >= 18 do
            IO.puts "Can Vote"
        else
            IO.puts "Can't Vote"
        end

        unless age == 18 do
            IO.puts "You are not 18"
        end

        if age >= 16 do
            IO.puts "Can drive"
        end

        "-------------------------------------------" |> IO.puts
        "COND" |> IO.puts
        age2 = 19
        # Evaluates the expression corresponding to the first clause that evaluates to a truthy value
        cond do
            age2 >= 18 -> IO.puts "You can vote and drive"
            age2 >= 16 -> IO.puts "You can drive"
            age2 >= 14 -> IO.puts "You can wait"
            true -> IO.puts "Default case"
        end

        "-------------------------------------------" |> IO.puts
        "CASE" |> IO.puts
        # Matches the given expression against the given clauses.
        x = 2
        case x do
            1 -> "Entered 1" |> IO.puts
            2 -> "Entered 2" |> IO.puts
            3 -> "Entered 3" |> IO.puts
            4 -> "Entered 4" |> IO.puts
            _ -> "Default"   |> IO.puts
        end

        "-------------------------------------------" |> IO.puts
        "TERNARY OPERATOR" |> IO.puts
        age3 = 16
        (if age3 > 18, do: "Can vote", else: "Too young") |> IO.puts
    end
end
