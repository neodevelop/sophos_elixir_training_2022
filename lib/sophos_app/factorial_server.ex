defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial

  def handle_message({:compute, n}, caller) do
    result = Factorial.of(n)
    send(caller, {:compute, n, result})
  end

  def handle_message({:status}, caller) do
    send(caller, {:ok, caller})
  end
end
