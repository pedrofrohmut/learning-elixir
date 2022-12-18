defmodule AuctionWeb.Router do
    use AuctionWeb, :router

    pipeline :browser do
        plug :accepts, ["html"]
        plug :fetch_session
        plug :fetch_live_flash
        plug :put_root_layout, {AuctionWeb.LayoutView, :root}
        plug :protect_from_forgery
        plug :put_secure_browser_headers
        plug AuctionWeb.Authenticator
    end

    pipeline :api do
        plug :accepts, ["json"]
    end

    scope "/", AuctionWeb do
        pipe_through :browser

        get "/", PageController, :index

        # These routes are the default ones that are created with resources
        # get    "/items",          ItemsController, :index
        # get    "/items/new",      ItemsController, :new
        # post   "/items",          ItemsController, :create
        # get    "/items/:id",      ItemsController, :show
        # get    "/items/:id/edit", ItemsController, :edit
        # patch  "/items/:id",      ItemsController, :update
        # put    "/items/:id",      ItemsController, :update
        # delete "/items/:id",      ItemsController, :delete
        resources "/items", ItemsController, 
             only: [:index, :show, :new, :create, :edit, :update] 
        do
            # Nested routes <BASE_URL>/items/123/bids
            resources "/bids",  BidsController,  only: [:create]
        end

        resources "/users", UsersController, only: [:show, :new, :create]


        get    "/signin",  SessionController, :new
        post   "/signin",  SessionController, :create
        delete "/signout", SessionController, :delete
    end

    # Other scopes may use custom stacks.
    # scope "/api", AuctionWeb do
    #   pipe_through :api
    # end

    # Enables LiveDashboard only for development
    #
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    if Mix.env() in [:dev, :test] do
        import Phoenix.LiveDashboard.Router

        scope "/" do
            pipe_through :browser
            live_dashboard "/dashboard", metrics: AuctionWeb.Telemetry
        end
    end

    # Enables the Swoosh mailbox preview in development.
    #
    # Note that preview only shows emails that were sent by the same
    # node running the Phoenix server.
    if Mix.env() == :dev do
        scope "/dev" do
            pipe_through :browser

            forward "/mailbox", Plug.Swoosh.MailboxPreview
        end
    end
end
