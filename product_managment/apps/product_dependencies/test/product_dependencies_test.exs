defmodule ProductDependenciesTest do
  use ExUnit.Case
  doctest ProductDependencies

  test "greets the world" do
    assert ProductDependencies.hello() == :world
  end
end
