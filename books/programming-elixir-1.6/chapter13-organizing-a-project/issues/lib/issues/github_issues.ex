defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "Elixir dave@pragprog.com" } ]
  @github_url Application.compile_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({ _, %{ status_code: status_code, body: body } }) do
    IO.puts "Status code: #{status_code}, Body: #{body}"
    res_code = if(status_code == 200, do: :ok, else: :error)
    res_body = Poison.Parser.parse!(body)
    { res_code, res_body }
  end
end
