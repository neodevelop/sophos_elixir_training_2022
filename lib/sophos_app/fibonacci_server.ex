defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def loop() do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.sequence(n)
        IO.inspect(caller)
        IO.inspect(self())
        send(caller, {:fibonacci, n, result})
        loop()

      {:status, msg} ->
        IO.puts("Running #{inspect(msg)}")
        loop()

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      _message ->
        IO.puts("Bad operation")
        loop()
        # after
        #   1500 -> IO.puts("Se acabó")
    end
  end
end
