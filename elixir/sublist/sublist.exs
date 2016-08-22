defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(a, b) when length(a) > length(b), do: false
  defp sublist?(a, b = [_ | t2]) do
    unless head?(a, b), do: sublist?(a, t2), else: true
  end

  defp head?([], _), do: true
  defp head?([h | t1], [h | t2]), do: head?(t1, t2)
  defp head?(_, _), do: false
end
