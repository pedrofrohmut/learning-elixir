defmodule Maps1 do
  defp keys(map), do: map |> Map.keys |> Kernel.inspect |> IO.puts

  defp values(map), do: map |> Map.values |> Kernel.inspect |> IO.puts

  defp get_name(map), do: map[:name] |> IO.puts

  defp get_likes(map), do: map.likes |> IO.puts

  defp droped_map(map, items_to_drop), do: Map.drop(map, items_to_drop) |> Kernel.inspect |> IO.puts

  defp plus_map(map, key, value) do
    result = Map.put(map, key, value)
    result |> Kernel.inspect |> IO.puts
    result
  end

  defp has_key(map, key), do: Map.has_key?(map, key) |> Kernel.inspect |> IO.puts

  defp map_pop(map, key) do
    { value, updated_map } = Map.pop(map, key)
    IO.puts "Poped Value: #{value}"
    updated_map |> Kernel.inspect |> IO.puts
    updated_map
  end

  defp check_equals(map1, map2), do: Map.equal?(map1, map2) |> IO.puts

  def main() do
    mymap = %{ name: "Dave", likes: "Programming", where: "Dallas" }
    keys(mymap)
    values(mymap)
    get_name(mymap)
    get_likes(mymap)
    droped_map(mymap, [:likes, :where])
    mymap2 = plus_map(mymap, :also_likes, "Ruby")
    has_key(mymap, :where)
    mymap3 = map_pop(mymap2, :also_likes)
    check_equals(mymap2, mymap3)
    :ok
  end
end
