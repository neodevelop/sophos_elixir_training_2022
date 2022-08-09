defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message({:compute, n}, _caller) do
    Factorial.of(n)
  end

  def handle_message({:status}, _caller) do
    :ok
  end
end
