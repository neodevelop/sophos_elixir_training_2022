defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.sequence(n)
        |> IO.inspect()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")

      message ->
        IO.inspect(message)
    after
      1500 -> IO.puts("Se acabó")
    end
  end
end
