defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) when num > 0, do: Stream.unfold([1], &next_row/1) |> Enum.take(num)

  defp next_row(list) do
    { list, Enum.reduce(list, [0], fn(x, [h | t]) -> [x | [h + x  | t]] end) }
  end
end
