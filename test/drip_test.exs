defmodule DripTest do
  use ExUnit.Case

  import Tesla.Mock

  setup do
    mock(fn
      %{method: _method} ->
        json(%{})
    end)
  end

  test "create_or_update_subscriber" do
    assert {:ok, %{}} = Drip.create_or_update_subscriber(%{})
  end

  test "delete_subscriber" do
    assert {:ok, %{}} = Drip.delete_subscriber("dev@dev.com")
  end

  test "record_event" do
    assert {:ok, %{}} = Drip.record_event(%{})
  end
end
