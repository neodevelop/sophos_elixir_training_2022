defmodule PingPongProcess do

  def start() do

    pid_pingPong = spawn(__MODULE__, :pingPong, [])

    pid_action = spawn_link(__MODULE__, :action, [])

    send(pid_action, {:action, ["ping",[pid_pingPong, pid_action]]})

  end

  def pingPong() do

    receive do

      {:switch, [action,[pid_pingPong, pid_action]]} ->

        :timer.sleep(1000)

        IO.puts(action)

        send(pid_action, {:action,[action,[pid_pingPong, pid_action]]})

      pingPong()

    end

  end

  def action()do

    receive do

      {:action, [lastAction,[pid_pingPong, pid_action]]} ->

        result = switch(lastAction)

        send(pid_pingPong, {:switch, [result, [pid_pingPong, pid_action]]})

      action()

    end

  end

  def switch(pinOrPong) when (pinOrPong == "ping"), do: "pong"

  def switch(pinOrPong) when (pinOrPong == "pong"), do: "ping"

end
