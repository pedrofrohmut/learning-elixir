import Config

config :auction, ecto_repos: [Auction.Repo]

config :auction, Auction.Repo,
    database: "auction",
    username: "myuser",
    password: "mypassword",
    hostname: "localhost",
    port:     "5432"
