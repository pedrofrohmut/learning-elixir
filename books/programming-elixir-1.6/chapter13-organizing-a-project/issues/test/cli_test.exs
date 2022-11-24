defmodule CLITest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [ parse_args: 1 , sort_desc: 1, take: 2 ]

  test "When args == -h or --help => :help" do
    assert parse_args(["-h"    , "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "Returns 3 when given 3" do
    assert parse_args(["user", "project", "99"]) == { "user", "project", 99 }
  end

  test "Count is defaulted when 2 values are given" do
    default_count = 4
    assert parse_args(["user", "project"]) == { "user", "project", default_count }
  end

  test "Sort issues by created_at is in the correct order" do
    result_list = sort_desc(create_fake_list(["c", "a", "d", "b"]))
    issues = for issue <- result_list, do: Map.get(issue, "created_at")
    # issues |> Kernel.inspect |> IO.puts
    assert issues == ~w{ d c b a }
  end

  defp create_fake_list(values) do
    for value <- values, do: %{"created_at" => value, "other_data" => "xxx"}
  end

  test "Take the same amount as the count passed" do
    result = take(~w{ d c b a }, 2)
    assert result == ~w{ d c }
  end
end
