defmodule SophosApp.FizzBuzz do
  def exec(n) do
    alias SophosApp.MyList, as: ML
    ML.generate(n)
  end

  def exec2(n) do
    MyList.generate(n)
  end
end
