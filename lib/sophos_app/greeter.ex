defmodule SophosApp.Greeter do
  def hello(), do: "Hello anon person"
  def hello(name, lang \\ "en"), do: phrase(lang) <> name
  # def hello(name1, name2), do: "Hello #{name1} and #{name2}"

  defp phrase("en"), do: "Howdy "
  defp phrase("es"), do: "Hola "
end
