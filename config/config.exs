import Config

if config_env() == :test do
  config :logger, :console, level: :warn

  config :tesla, Drip.Client, adapter: Tesla.Mock

  config :drip,
    api_key: "TEST_API_KEY",
    account_id: "TEST_ACCOUNT_ID",
    user_agent: "Test"
end
