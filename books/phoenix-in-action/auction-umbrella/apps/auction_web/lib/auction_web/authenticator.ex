defmodule AuctionWeb.Authenticator do
    import Plug.Conn

    def init(opts), do: opts

    def call(conn, _opts) do
        user_id = get_session(conn, :user_id)
        user = if(is_nil(user_id), do: nil, else: Auction.get_user(user_id))
        # user = conn
        #        |> get_session(:user_id)
        #        |> case do
        #            nil -> nil
        #            id  -> Auction.get_user(id)
        #        end
        assign(conn, :current_user, user)
    end
end
