defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def handle_message({:sequence, n}, _caller, state) do
    {:ok, Fibonacci.sequence(n), state + 1}
  end

  def handle_message({:status}, _caller, state) do
    {:ok, state, state}
  end
end
