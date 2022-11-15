defmodule StringMethods do
  def main() do
    # At(str, offset)
    IO.puts String.at("dog", 0) #=> d
    IO.puts String.at("dog", -1) #=> g

    # Capitalize(str)
    IO.puts String.capitalize("hello")

    # Codepoints(str) string in a list
    String.codepoints("Jose's dog") |> Kernel.inspect |> IO.puts

    # Upcase & Downcase
    IO.puts String.downcase("HELLO")
    IO.puts String.upcase("hello")

    # Ends_With
    IO.puts String.ends_with?("john@doe.com", [".com", ".org", ".net"])

    # Starts With
    IO.puts String.starts_with?("Hello, World!", ["Hello"])

    # Length
    IO.puts String.length("Hello, World!")

    # Replace
    String.replace("the cat on the mat", "at", "AT") |> IO.puts

    # Reverse
    IO.puts String.reverse("Hello") #=> olleH

    # Slice
    IO.puts String.slice("the cat on the mat", 4, 3) #=> cat

    # Split
    String.split("the cat on the mat") |> Kernel.inspect |> IO.puts

    # Trim
    IO.puts String.trim("          Hello, World!         ")

    # Valid
    IO.puts String.valid?("hello")
    IO.puts String.valid?(<< 0x80, 0x81 >>)
  end
end

StringMethods.main()
