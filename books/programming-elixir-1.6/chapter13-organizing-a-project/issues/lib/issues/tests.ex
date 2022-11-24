defmodule Issues.Tests do
  @user_agent [ { "User-agent", "Elixir dave@pragprog.com" } ]
  @github_url Application.compile_env(:issues, :github_url)

  def fetch(), do: (
      # url = "https://api.github.com/repos/pragdave/earmark/issues"
      IO.puts("ENV: #{@github_url}")
      url = "#{@github_url}/repos/pragdave/earmark/issues"
      response = HTTPoison.get!(url)
      Poison.Parser.parse!(response.body)
  )

  def fetch(user, project) do
    url = "#{@github_url}/repos/#{user}/#{project}/issues"
    response = HTTPoison.get(url, @user_agent)
    response |> Kernel.inspect() |> IO.puts()
    response
  end
end
