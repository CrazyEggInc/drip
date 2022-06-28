defmodule Drip do
  @moduledoc """
  Drip API functions
  """

  # ===============================================================================================
  # Subscribers/people

  @doc """
  Create or update subscriber

  For available params please consult Drip documentation
  https://developer.drip.com/#create-or-update-a-subscriber
  """
  @spec create_or_update_subscriber(params :: map()) :: {:ok, map} | {:error, atom()}
  def create_or_update_subscriber(params) do
    "/subscribers"
    |> Drip.Client.post(params)
    |> Drip.Handler.handle()
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

  For available params please consult Drip documentation
  https://developer.drip.com/#record-an-event
  """
  @spec record_event(params :: map()) :: {:ok, map} | {:error, atom()}
  def record_event(params) do
    "/events"
    |> Drip.Client.post(params)
    |> Drip.Handler.handle()
  end
end
