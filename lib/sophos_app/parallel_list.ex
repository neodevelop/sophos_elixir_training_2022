defmodule SophosApp.ParallelList do
  def pmap(list, fun) do
    list
    |> Enum.map(&spawn_process(&1, self(), fun))
    |> Enum.map(&await/1)
  end

  defp spawn_process(e, caller, fun) do
    spawn_link(fn ->
      send(caller, {self(), fun.(e)})
    end)
  end

  defp await(pid) do
    receive do
      {^pid, result} -> result
    end
  end
end
