defmodule SophosApp.FizzBuzz do
  alias SophosApp.MyList

  def exec(n) do
    MyList.generate(n)
  end
end
