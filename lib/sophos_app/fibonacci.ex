defmodule SophosApp.Fibonacci do
  def sequence(0), do: 0
  def sequence(1), do: 1

  def sequence(n) do
    sequence(n - 1) + sequence(n - 2)
  end

  def sequence_with_tail(n) do
    do_sequence(n, 1, [1, 0])
  end

  defp do_sequence(n, n, [h | _]), do: h

  defp do_sequence(n, i, [n2, n1 | _t] = l) do
    do_sequence(n, i + 1, [n1 + n2 | l])
  end
end
