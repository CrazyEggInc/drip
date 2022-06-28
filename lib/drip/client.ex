defmodule Drip.Client do
  @moduledoc """
  Drip API generic client
  """
  use Tesla

  adapter Tesla.Adapter.Hackney

  plug Tesla.Middleware.BaseUrl,
       "https://api.getdrip.com/v2/#{Application.fetch_env!(:drip, :account_id)}"

  plug Tesla.Middleware.JSON, engine_opts: [keys: :atoms]

  plug Tesla.Middleware.BasicAuth,
    username: Application.fetch_env!(:drip, :api_key),
    password: ""

  plug Tesla.Middleware.Headers, [
    {"user-agent", Application.get_env(:drip, :user_agent, "Elixir Drip client")}
  ]

  plug Tesla.Middleware.Logger
end
