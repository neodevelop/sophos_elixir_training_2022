defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def handle_message({:sequence, n}, _caller) do
    {:ok, Fibonacci.sequence(n)}
  end

  def handle_message({:status}, _caller) do
    {:ok, :ok}
  end
end
