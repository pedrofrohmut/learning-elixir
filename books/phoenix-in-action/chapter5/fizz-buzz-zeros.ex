# Fizz Buzz Zero
my_func = fn
  (0,0,_) -> "FizzBuzz"
  (0,_,_) -> "Fizz"
  (_,0,_) -> "Buzz"
  (_,_,n) -> n  
end

IO.puts my_func.(0,0,3)
IO.puts my_func.(0,3,3)
IO.puts my_func.(3,0,3)
IO.puts my_func.(6,6,3)

# Fizz Buzz 2
my_func2 = fn (a, b, c) -> my_func.(a, b, c)  end

IO.puts my_func2.(rem(10, 3), rem(10,5), 10)
IO.puts my_func2.(rem(11, 3), rem(11,5), 11)
IO.puts my_func2.(rem(12, 3), rem(12,5), 12)
IO.puts my_func2.(rem(13, 3), rem(13,5), 13)
IO.puts my_func2.(rem(14, 3), rem(14,5), 14)
IO.puts my_func2.(rem(15, 3), rem(15,5), 15)
IO.puts my_func2.(rem(16, 3), rem(16,5), 16)
