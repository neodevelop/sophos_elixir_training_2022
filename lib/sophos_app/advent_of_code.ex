defmodule SophosApp.AdventOfCode.Day1 do
  def deliver(instructions) do
    instructions
    |> String.split("", trim: true)
    |> evaluate(0)
  end

  defp evaluate([], floor), do: floor

  defp evaluate([h | t], floor) do
    evaluate(t, walk(floor, h))
  end

  defp walk(floor, "("), do: floor + 1
  defp walk(floor, ")"), do: floor - 1
end
