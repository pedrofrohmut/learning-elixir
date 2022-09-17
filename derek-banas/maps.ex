defmodule M do
    def main do
        do_stuff()
    end

    def do_stuff() do
      capitals = %{
        "Alabama" => "Montgomery",
        "Alaska"  => "Juneau",
        "Arizona" => "Phoenix"
      }
      IO.puts "Capital of Alaska is #{capitals["Alaska"]}"
      capitals3 = Map.put_new(capitals, "Arkansas", "Little Rock")

      capitals2 = %{
        alabama: "Montgomery",
        alaska: "Juneau",
        arizona: "Phoenix"
      }
      IO.puts "Capital of arizona is #{capitals2.arizona}"
      capitals4 = Map.put_new(capitals2, :arkansas, "Little Rock")
    end
 end
