defmodule GoalsWeb.UsersView do
    use GoalsWeb, :view

    def render("hello.json", params) do
        %{ data: params.hello }
    end
end
