defmodule ProductInventoryTest do
  use ExUnit.Case
  doctest ProductInventory

  test "greets the world" do
    assert ProductInventory.hello() == :world
  end
end
