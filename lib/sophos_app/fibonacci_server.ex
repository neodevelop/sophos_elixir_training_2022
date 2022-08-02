defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def loop() do
    receive do
      {:sequence, n} ->
        Fibonacci.sequence(n)
        |> IO.inspect()

        loop()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")
        loop()

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      message ->
        IO.inspect(message)
        loop()
        # after
        #   1500 -> IO.puts("Se acabó")
    end
  end
end
