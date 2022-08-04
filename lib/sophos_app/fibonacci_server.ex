defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [])
  end

  def start_link() do
    spawn_link(__MODULE__, :loop, [])
  end

  def start_monitor() do
    spawn_monitor(__MODULE__, :loop, [])
  end

  def loop() do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.sequence(n)
        send(caller, {:fibonacci, n, result})
        loop()

      {:status, caller, msg} ->
        send(caller, {:status, :ok, msg})
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
