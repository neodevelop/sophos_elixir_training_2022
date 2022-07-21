defmodule SophosApp.AdventOfCode.Day1 do
  def deliver(instructions) do
    instructions
    |> String.split("", trim: true)
    |> evaluate(0)
  end

  def deliver2(instructions) do
    instructions
    |> String.split("", trim: true)
    |> transform([])
    |> SophosApp.MyList.sum()
  end

  defp evaluate([], floor), do: floor

  defp evaluate([h | t], floor) do
    evaluate(t, walk(floor, h))
  end

  defp walk(floor, "("), do: floor + 1
  defp walk(floor, ")"), do: floor - 1

  defp transform([], list), do: list

  defp transform(["(" | t], list) do
    transform(t, [1 | list])
  end

  defp transform([")" | t], list) do
    transform(t, [-1 | list])
  end
end
