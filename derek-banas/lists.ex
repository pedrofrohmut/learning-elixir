defmodule M do
    def main do
        do_stuff()
    end

    def do_stuff() do
        list1 = [1,2,3]
        IO.inspect list1
        list2 = [4,5,6]
        IO.inspect list2
        # Concat
        list3 = list1 ++ list2
        IO.inspect list3
        # Remove a list from a list
        list4 = list3 -- list1
        IO.inspect list4
        # Check if a list contains a elem
        IO.puts "6 in list4? #{6 in list4}"
        # Head (first elem) and Tail (rest of the list)
        [head | tail] = list3
        IO.write "Head: #{head}"
        IO.write ", Tail: "
        IO.inspect tail

        # For each elem of list apply fn
        Enum.each list3, fn item -> IO.puts item end

        words = ["Random", "Words", "in a", "list"]
        Enum.each words, fn word -> IO.puts word end

        # Recursion Function
        display_list(words)

        # Delete from list
        words2 = List.delete(words, "Words")
        IO.write "Words2: "
        IO.inspect words2

        # Delete from list by index
        words3 = List.delete_at(words, 2)
        IO.write "Words3: "
        IO.inspect words3

        # insert at
        words4 = List.insert_at(words, 2, "yeah")
        IO.write "Words4: "
        IO.inspect words4

        IO.puts "First #{List.first(words)}"
        IO.puts "Last #{List.last(words)}"

        # List of key/value tuples
        my_stats = [name: "Pedro", age: 33, height: 185]
    end

    # A recursion condition for empty list
    #def display_list(), :do nil

    # Recursion end condition
    def display_list([word]) do
      IO.puts word
    end

    # Recursion main
    def display_list([word|words]) do
        IO.puts word
        display_list(words)
    end
 end
