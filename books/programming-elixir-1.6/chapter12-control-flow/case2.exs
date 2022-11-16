defmodule Case2 do
  defp print_state(person) do
    case person do
      %{ state: state } = person ->
        IO.puts "#{person.name} lives in #{person.state}"
      _ ->
        IO.puts "No matches"
    end
  end

  defp print_can_enter_old(person) do
    case person do
      %{ age: age } = person when is_number(age) and age >= 21 ->
        IO.puts "You are cleared to enter"
      _ ->
        IO.puts "Sorry, no admission"
    end
  end

  def main() do
    dave = %{ name: "Dave", state: "TX", likes: "programming" }
    bob = %{ name: "Bob", likes: "Fishing", age: 33 }
    sarah = %{ name: "Sarah", state: "NY", age: 16 }
    Enum.each([dave, bob, sarah], &print_state/1)
    Enum.each([dave, bob, sarah], &print_can_enter/1)
  end
end

Case2.main()
