defmodule Drip do
  @moduledoc """
  Drip API functions
  """

  # ===============================================================================================
  # Subscribers/people

  @doc """
  List all subscribers

  For available params please consult Drip documentation
  https://developer.drip.com/#list-all-subscribers
  """
  def list_all_subscribers(opts \\ []) do
    "/subscribers"
    |> Drip.Client.get(query: opts)
    |> Drip.Handler.handle()
  end

  @doc """
  Create or update subscriber

  If submitted list of subscribers batch API is used

  For available params please consult Drip documentation
  https://developer.drip.com/#create-or-update-a-subscriber
  """
  @spec create_or_update_subscriber(data :: [map()] | map()) ::
          {:ok, map()} | {:error, atom()}
  def create_or_update_subscriber(subscriber) when is_map(subscriber) do
    "/subscribers"
    |> Drip.Client.post(%{subscribers: [subscriber]})
    |> Drip.Handler.handle()
  end

  def create_or_update_subscriber(subscribers) when is_list(subscribers) do
    data =
      subscribers
      |> Enum.chunk_every(1000)
      |> Enum.map(&%{subscribers: &1})

    for batch <- data do
      "/subscribers/batches"
      |> Drip.Client.post(%{batches: [batch]})
      |> Drip.Handler.handle()
    end
  end

  @doc """
  Unsubscribe user or list of users from all campaigns

  For available params please consult Drip documentation
  https://developer.drip.com/#unsubscribe-from-all-mailings
  """
  @spec unsubscribe(String.t() | [String.t()]) :: {:ok, map()} | {:error, atom()}
  def unsubscribe(user) when is_binary(user) do
    "/subscribers/#{user}/unsubscribe_all"
    |> Drip.Client.post("")
    |> Drip.Handler.handle()
  end

  def unsubscribe(users) when is_list(users) do
    data =
      users
      |> Enum.chunk_every(1000)
      |> Enum.map(&%{email: &1})

    for batch <- data do
      "/unsubscribes/batches"
      |> Drip.Client.post(%{batches: [%{subscribers: batch}]})
      |> Drip.Handler.handle()
    end
  end

  @doc """
  Delete subscriber

  You have to provide subscriber ID or email
  https://developer.drip.com/#delete-a-subscriber
  """
  @spec delete_subscriber(id_or_email :: binary()) :: {:ok, map} | {:error, atom()}
  def delete_subscriber(id_or_email) do
    "/subscribers/#{id_or_email}"
    |> Drip.Client.delete()
    |> Drip.Handler.handle()
  end

  # ===============================================================================================
  # Events

  @doc """
  Record an event

  If submitted list of events batch API is used

  For available params please consult Drip documentation
  https://developer.drip.com/#record-an-event
  """
  @spec record_event(data :: [map()] | map()) :: {:ok, map} | {:error, atom()}
  def record_event(event) when is_map(event) do
    "/events"
    |> Drip.Client.post(%{events: [event]})
    |> Drip.Handler.handle()
  end

  def record_event(events) when is_list(events) do
    data =
      events
      |> Enum.chunk_every(1000)
      |> Enum.map(&%{events: &1})

    for batch <- data do
      "/events/batches"
      |> Drip.Client.post(%{batches: [batch]})
      |> Drip.Handler.handle()
    end
  end
end
