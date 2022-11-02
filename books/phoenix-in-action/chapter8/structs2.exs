defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "Missing name for badge"
  end

  def main() do
    a1 = %Attendee{name: "Dave", over_18: true}
    a1 |> Kernel.inspect |> IO.puts
    Attendee.may_attend_after_party(a1) |> IO.puts

    a2 = %Attendee{ a1 | paid: true }
    a2 |> Kernel.inspect |> IO.puts
    Attendee.may_attend_after_party(a2) |> IO.puts
    Attendee.print_vip_badge(a2) |> IO.puts

    a3 = %Attendee{}
    Attendee.print_vip_badge(a3) |> IO.puts
  end
end

Attendee.main()
