defmodule SophosApp.FizzBuzz do
  alias SophosApp.MyList

  def fizz_buzz_case(n) do
    n |> MyList.generate() |> process_list_case([])
  end

  def fizz_buzz_cond(n) do
    n |> MyList.generate() |> process_list_cond([])
  end

  def fizz_buzz_pattern(n) do
    n |> MyList.generate() |> process_list_pattern([])
  end

  defp process_list_case([], l), do: l

  defp process_list_case([h | t], l) do
    e =
      case h do
        h when rem(h, 15) == 0 -> :fizz_buzz
        h when rem(h, 3) == 0 -> :fizz
        h when rem(h, 5) == 0 -> :buzz
        h -> h
      end

    process_list_case(t, l ++ [e])
  end

  defp process_list_cond([], l), do: l

  defp process_list_cond([h | t], l) do
    e =
      cond do
        rem(h, 15) == 0 -> :fizz_buzz
        rem(h, 3) == 0 -> :fizz
        rem(h, 5) == 0 -> :buzz
        true -> h
      end

    process_list_cond(t, l ++ [e])
  end

  defp process_list_pattern([], l), do: l

  defp process_list_pattern([h | t], l) do
    e = evaluate({rem(h, 15), rem(h, 5), rem(h, 3), h})
    process_list_cond(t, l ++ [e])
  end

  defp evaluate({0, _, _, _}), do: :fizzbuzz
  defp evaluate({_, 0, _, _}), do: :buzz
  defp evaluate({_, _, 0, _}), do: :fizz
  defp evaluate({_, _, _, h}), do: h
end
