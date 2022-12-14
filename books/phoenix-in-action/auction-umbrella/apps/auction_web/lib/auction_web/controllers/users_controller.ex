defmodule AuctionWeb.UsersController do
    use AuctionWeb, :controller

    plug :prevent_unauthorized_access when action in [:show]

    defp prevent_unauthorized_access(conn, _opts) do
        current_user = Map.get(conn.assigns, :currect_user)
        requested_user_id = conn.params |> Map.get("id") |> String.to_integer()
        if is_nil(current_user) || current_user.id != requested_user_id do
            conn
            |> put_flash(:error, "Nice try, friend. That's not a page for you.")
            |> redirect(to: Routes.items_path(conn, :index))
            |> halt()
        else
            conn
        end
    end

    def show(conn, %{ "id" => id }) do
        user = Auction.get_user(id)
        render(conn, "show.html", user: user)
    end

    def new(conn, _params) do
        user = Auction.new_user()
        render(conn, "new.html", user: user)
    end

    def create(conn, %{ "user" => user_params }) do
        case Auction.insert_user(user_params) do
            { :ok,    user } -> redirect(conn, to: Routes.users_path(conn, :show, user))
            { :error, user } -> render(conn, "new.html", user: user)
        end
    end
end
