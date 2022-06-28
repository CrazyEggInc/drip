# Installation

Add `:drip` as dependency:

```elixir
  defp deps do
    [
      {:drip, "~> 0.1.0"},
    ]
  end
```

Configure your access key to Drip in `config/runtime.exs`:

```elixir
config :drip,
  api_key: System.get_env("DRIP_API_KEY"),
  account_id: System.get_env("DRIP_ACCOUNT_ID"),
  user_agent: "Your App Name (www.yourapp.com)"
```
