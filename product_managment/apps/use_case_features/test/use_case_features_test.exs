defmodule UseCaseFeaturesTest do
  use ExUnit.Case
  doctest UseCaseFeatures

  test "greets the world" do
    assert UseCaseFeatures.hello() == :world
  end
end
