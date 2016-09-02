defmodule BinarySearch do
  @doc """
    Searches for a key in the list using the binary search algorithm.
    It returns :not_found if the key is not in the list.
    Otherwise returns the tuple {:ok, index}.

    ## Examples

      iex> BinarySearch.search([], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 5)
      {:ok, 2}

  """

  @spec search(Enumerable.t, integer) :: {:ok, integer} | :not_found
  def search(list, key) do
    unless Enum.sort(list) == list, do: raise ArgumentError, "expected list to be sorted"
    guess(:array.from_list(list), key, 0, length(list) - 1)
  end

  defp guess(_, _, lo, hi) when hi < lo, do: :not_found
  defp guess(ar, v, lo, hi) do
    mid = lo + div(hi - lo, 2)
    case :array.get(mid, ar) do
      x when v < x -> guess(ar, v, lo, mid - 1)
      x when v > x -> guess(ar, v, mid + 1, hi)
      _ -> {:ok, mid}
    end
  end
end
