defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def handle_message({:sequence, n}, _caller, state) do
    result = Fibonacci.sequence(n)
    {:ok, result, [result | state]}
  end

  def handle_message({:status}, _caller, state) do
    {:ok, state, state}
  end
end
