defmodule MilestoneFeaturesTest do
  use ExUnit.Case
  doctest MilestoneFeatures

  test "greets the world" do
    assert MilestoneFeatures.hello() == :world
  end
end
