defmodule SophosAppTest do
  use ExUnit.Case
  doctest SophosApp

  test "greets the world" do
    assert SophosApp.hello() == :world
  end
end
