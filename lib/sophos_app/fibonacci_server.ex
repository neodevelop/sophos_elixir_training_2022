defmodule SophosApp.FibonacciServer do
  def loop() do
    receive do
      message -> IO.puts(message)
    end
  end
end
