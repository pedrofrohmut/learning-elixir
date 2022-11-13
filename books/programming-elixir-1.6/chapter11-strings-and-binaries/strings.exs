defmodule Strings do
  def main() do
    name = "Dave"
    IO.puts "Hello, #{String.capitalize(name)}"

    # Heredocs
    IO.puts "start"
    IO.write "
        my
        string
    "
    IO.puts "end"

    # Heredocs with triple quotes
    IO.puts "start"
    IO.write """
      my
      string
      """
    IO.puts "end"

    # Sigils - Character list
    IO.puts ~C[1\n2#{1+2}]
    IO.puts ~c"1\n2#{1+2}"

    # Sigils - Strings
    IO.puts ~S[1\n2#{1+2}]
    IO.puts ~s/1\n2#{1+2}/

    # Sigils - A list of words
    ~W[the c#{'a'}t sat on the mat] |> Kernel.inspect |> IO.puts
    ~w[the c#{'a'}t sat on the mat] |> Kernel.inspect |> IO.puts

    # Sigils - the extra option at the end
    ~w[the c#{'a'}t sat on the mat]a # Atoms
    ~w[the c#{'a'}t sat on the mat]c # Character list
    ~w[the c#{'a'}t sat on the mat]s # String list

    # Single quoted are lists of characters
    str = 'wombat'
    IO.puts "Is a list#{is_list(str)}"
    IO.puts "Length: #{length(str)}"
    IO.puts Enum.reverse(str)

    # Because character lists are list we can use list functions on them
    IO.puts 'pole' ++ 'vault'
    IO.puts 'pole' -- 'vault'
    List.zip(['abc', '123']) |> Kernel.inspect |> IO.puts
    [head | tail] = 'cat'
    IO.puts head
    IO.puts tail
    IO.puts [head | tail]
 end
end

Strings.main()
