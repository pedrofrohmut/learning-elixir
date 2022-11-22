defmodule Issues.CLI do
  @default_count 4

  @moduledoc"""
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ issues in a github project
  """

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help.
  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format.
  Return a tuple of `{ user, project, count }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    parsed_opts = OptionParser.parse(argv, switches: [ help: :boolean ], aliases: [ h: :help ])
    convert(parsed_opts)
  end

  defp convert({ _, [user, project, count], _ }), do: { user, project, String.to_integer(count) }

  defp convert({ _, [user, project], _ }), do: { user, project, @default_count }

  defp convert(_), do: :help

  def process(:help) do
    IO.puts """
    usage: issues <user> <project> [count | #{@default_count}]
    """
    System.halt(0)
  end

  def process({ user, project, count }) do
    Issues.GithubIssues.fetch(user, project) 
    |> decode_response()
    |> sort_desc()
    |> take(count)
  end

  def decode_response({ :ok, body }), do: body

  def decode_response({ :error, error }) do
    IO.puts "Error handling from Github #{error["message"]}"
    System.halt(2)
  end

  def sort_desc(issues) do
    issues 
    |> Enum.sort(fn a, b -> a["created_at"] >= b["created_at"] end)
  end

  def take(issues, count) do
    issues
    |> Enum.take(count)
  end
end
