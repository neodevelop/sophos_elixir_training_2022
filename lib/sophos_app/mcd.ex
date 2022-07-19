defmodule SophosApp.MCD do
  def mcd(a, 0), do: a
  def mcd(a, b), do: mcd(b, rem(a, b))
end
