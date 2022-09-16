defmodule M do
  def main do
    do_stuff()
  end

  defp do_stuff() do
    my_str = "My sentence"
  
  # Get string length
    IO.puts "Length: #{String.length(my_str)}"

   # Concat strings
    longer_str = my_str <> " " <> "is longer"
    IO.puts longer_str

    IO.puts "--------------------------------------------------------------"
    
    # compare strings
    IO.puts "Is equal: #{"Egg" === "egg"}"

    IO.puts "--------------------------------------------------------------"

    # string contains
    IO.puts "Contains '?'        #{String.contains?(longer_str, "?")}"
    IO.puts "Contains 'sentence' #{String.contains?(longer_str, "sentence")}"
    
    IO.puts "--------------------------------------------------------------"

    IO.puts "First:     #{String.first(my_str)}"
    IO.puts "Last:      #{String.last(my_str)}"
    IO.puts "Index 3:   #{String.at(my_str, 3)}"
    IO.puts "Substring: #{String.slice(my_str, 3, 8)}"
    
    IO.puts "--------------------------------------------------------------"

    IO.inspect String.split(longer_str, " ")
    
    IO.puts "--------------------------------------------------------------"

    # With then you can then get the value from pipe the string interpolation
    # Then accepts a value the comes from pipe in x and you can use it in a 
    # lambda function
    longer_str 
    |> String.reverse 
    |> then(fn x -> "Reverse:    #{x}" end) 
    |> IO.puts
   
    # The pipe chain in the same line
    longer_str |> String.upcase |> then(fn x -> "Uppercase:  #{x}" end) |> IO.puts
    
    # The same process without the pipes chain
    IO.puts "Downcase:   #{String.downcase(longer_str)}"
   
    # With (optional) parethesis if you like
    IO.puts("Capitalize: #{String.capitalize(longer_str)}")
  end
end
