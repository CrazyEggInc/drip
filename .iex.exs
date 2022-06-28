Logger.configure(level: :debug, format: "[$level] $message\n")

Application.put_env(:drip, :api_key, System.get_env("DRIP_API_KEY"))
Application.put_env(:drip, :account_id, System.get_env("DRIP_ACCOUNT_ID"))
Application.put_env(:drip, :user_agent, System.get_env("DRIP_USER_AGENT"))
