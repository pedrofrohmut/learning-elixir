defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

defmodule M do
  def main() do
    report = %{
      owner: %Customer{
        name: "Dave",
        company: "Pragmatic"
      },
      details: "broken",
      severity: "Pragmatic"
    }

    IO.inspect(report)

    IO.puts "Name:     #{report.owner.name}"
    IO.puts "Company:  #{report.owner.company}"
    IO.puts "Details:  #{report.details}"
    IO.puts "Severity: #{report.severity}"

    # set value of nested dictionaries
    report2 = put_in(report.owner.company, "PragProg")

    IO.inspect(report2)
  end
end

M.main()
