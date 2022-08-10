defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message({:compute, n}, _caller, state) do
    {:ok, Factorial.of(n), state + 1}
  end

  def handle_message({:status}, _caller, state) do
    {:ok, state, state}
  end
end
