defmodule Issues.GithubIssues do
  require Logger

  @user_agent [ { "User-agent", "Elixir dave@pragprog.com" } ]
  @github_url Application.compile_env(:issues, :github_url)

  def fetch(user, project) do
    Logger.info "Fetching #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response()
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({ _, %{ status_code: status_code, body: body } }) do
    res_code = if(status_code == 200, do: :ok, else: :error)
    res_body = Poison.Parser.parse!(body)
    Logger.info("Got response with status code of #{status_code}")
    Logger.debug(fn -> inspect(res_body) end)
    { res_code, res_body }
  end
end
