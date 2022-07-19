defmodule SophosApp.Math do
  def sum(a, b) do
    a + b
  end

  def mcd(a, 0), do: a
  def mcd(a, b), do: mcd(b, rem(a, b))

  def kind(n) when n < 0, do: :negative
  def kind(0), do: :zero
  def kind(n) when n > 0, do: :positive

  defmodule Geometry.Rectangle do
    def area(a), do: area(a, a)
    def area(a, b), do: a * b
  end
end
