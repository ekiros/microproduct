defmodule PersonasTest do
  use ExUnit.Case
  doctest Personas

  test "greets the world" do
    assert Personas.hello() == :world
  end
end
