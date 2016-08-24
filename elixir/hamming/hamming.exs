defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(s, s), do: {:ok, 0}
  def hamming_distance(s, c) when length(s) == length(c), do: {:ok, dist(s, c, 0)}
  def hamming_distance(_, _), do: {:error, "Lists must be the same length"}

  defp dist([], [], count), do: count
  defp dist([h | t1], [h | t2], count), do: dist(t1, t2, count)
  defp dist([_ | t1], [_ | t2], count), do: dist(t1, t2, count + 1)
end
