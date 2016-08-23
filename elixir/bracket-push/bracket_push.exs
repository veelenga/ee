defmodule BracketPush do
  @brackets %{ ?[ => ?], ?{ => ?}, ?( => ?) }
  @opened   Map.keys(@brackets)
  @closed   Map.values(@brackets)
  @all      @opened ++ @closed

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str |> String.to_charlist |> brackets_match?
  end

  defp brackets_match?(charlist) do
    charlist
    |> Enum.reduce_while([],
        fn(x, stack) ->
          cond do
            x in @closed and pair?(stack, x) -> {:cont, List.delete_at(stack, 0)}
            x in @opened -> {:cont, [x | stack]}
            not x in @all -> {:cont, stack}
            true -> {:halt, [:fail]} # stop early: closed, but no pair
          end
        end
      )
    |> Enum.empty?
  end

  defp pair?([], _), do: false
  defp pair?([bracket | _], close), do: pair?(bracket, close)
  defp pair?(open, close), do: Map.get(@brackets, open) == close
end
