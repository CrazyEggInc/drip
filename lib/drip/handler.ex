defmodule Drip.Handler do
  @moduledoc """
  Response handler
  """

  require Logger

  @doc """
  Handle Tesla result and transform it
  """
  @spec handle(Tesla.Env.result()) :: {:ok, map()} | {:error, atom() | map()}
  def handle({:ok, %Tesla.Env{status: status, body: body}}) when status >= 200 and status < 300 do
    Logger.debug("Handling success response")
    {:ok, body}
  end

  def handle({:ok, %Tesla.Env{status: 401}}) do
    Logger.error("Drip authentication error. Check your API key and account ID config")
    {:error, :authentication_error}
  end

  def handle({:ok, %Tesla.Env{status: 422, body: body}}) do
    Logger.error("Drip validation error. Please check the API docs for more info")
    {:error, body}
  end

  def handle({:ok, %Tesla.Env{status: status, body: body}}) do
    Logger.warning("Unhandled status #{status}")
    {:ok, body}
  end

  def handle({:error, error}) do
    Logger.error("Drip request exited with an error: #{inspect(error)}")
    {:error, :unknown}
  end
end
