defmodule UseCasesTest do
  use ExUnit.Case
  doctest UseCases

  test "greets the world" do
    assert UseCases.hello() == :world
  end
end
