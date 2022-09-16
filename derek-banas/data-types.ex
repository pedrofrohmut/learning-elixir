defmodule M do
    def main do
        data_stuff()
    end

    defp data_stuff do
        # There is no limits to integers in elixir
        my_int = 123
        IO.puts "Is Integer #{is_integer(my_int)}"

        # Floats are accurate to 16 digits
        my_float = 3.14159
        IO.puts "Is Float #{is_float(my_float)}"

        # Atoms values are the same as their name
        my_atom = :pittsburgh
        IO.puts "Is Atom #{is_atom(:pittsburgh)}"
        my_atom_with_spaces = :"New York"
        IO.puts "Atom with spaces #{:"New York"}"

        # Ranges
        one_to_10 = 1..10
    end
end
