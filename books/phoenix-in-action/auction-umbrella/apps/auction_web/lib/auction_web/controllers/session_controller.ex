defmodule AuctionWeb.SessionController do
    use AuctionWeb, :controller

    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{ "user" => %{  "username" => username, "password" => password } }) do
        case Auction.get_user_by_username_and_password(username, password) do
            %Auction.User{} = user -> send_success_login(conn, user)
            _                      -> send_error_login(conn)
        end
    end

    defp send_success_login(conn, user) do
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Successfully logged in")
        |> redirect(to: Routes.users_path(conn, :show, user))
    end

    defp send_error_login(conn) do
        conn
        |> put_flash(:error, "That username and password combination cannot be found")
        |> render("new.html")
    end

    def delete(conn, _params) do
        ####
    end
end
