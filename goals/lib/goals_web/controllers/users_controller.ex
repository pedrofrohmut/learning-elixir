defmodule GoalsWeb.UsersController do
    use GoalsWeb, :controller

    def hello(conn, %{ "name" => name }) do
        hello = "Hello, #{name}!"
        render(conn, "hello.json", hello: hello)
    end
end
