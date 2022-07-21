defmodule SophosApp.Hello do
  defmacro __using__(opts) do
    greet = Keyword.get(opts, :greeting, "Hi")

    quote do
      def hello(name), do: unquote(greet) <> ", " <> name
    end
  end
end
