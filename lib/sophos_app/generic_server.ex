defmodule SophosApp.GenericServer do
  def start(module, caller) do
    spawn(fn -> loop(module, caller) end)
  end

  def loop(module, caller) do
    receive do
      msg ->
        {:ok, result} = module.handle_message(msg, caller)
        send(caller, result)
        loop(module, caller)
    end
  end
end
