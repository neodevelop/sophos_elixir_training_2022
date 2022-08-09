defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message({:compute, n}, _caller) do
    {:ok, Factorial.of(n)}
  end

  def handle_message({:status}, _caller) do
    {:ok, :ok}
  end
end
