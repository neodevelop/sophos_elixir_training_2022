defmodule SophosApp.FibonacciGenServer do
  use GenServer

  alias SophosApp.Fibonacci

  # Client API

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def compute(pid, n) do
    GenServer.cast(pid, {:sequence, n})
  end

  def status(pid) do
    GenServer.call(pid, :status)
  end

  # Callbacks

  def init(_arg) do
    {:ok, %{}}
  end

  def handle_call({:sequence, n}, _from, state) do
    result = compute_sequence(n, state)

    new_state = Map.put_new(state, n, result)
    {:reply, result, new_state}
  end

  def handle_call(:status, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:sequence, n}, state) do
    result = compute_sequence(n, state)
    new_state = Map.put_new(state, n, result)
    {:noreply, new_state}
  end

  defp compute_sequence(n, state) do
    state
    |> Map.fetch(n)
    |> case do
      {:ok, r} -> r
      :error -> Fibonacci.sequence(n)
    end
  end
end
