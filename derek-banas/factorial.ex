defmodule M do
     def main do
         do_stuff()
     end

     def do_stuff() do
         IO.puts "Factorial of 5: #{factorial(5)}"
     end

     # Elixir always return the last line of the function without the need of the return keyword
     def factorial(n) do
         # recursion break codition (without it goes to infinite calculation)
         if n <= 1 do
             1
         else
             n * factorial(n - 1)
         end
     end
 end
