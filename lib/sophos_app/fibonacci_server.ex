defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.sequence(n)

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")

      message ->
        IO.inspect(message)
    end
  end
end
