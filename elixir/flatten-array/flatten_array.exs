defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flatten(list, [])

  defp flatten([h | t], acc) when h == [] or is_nil(h), do: flatten(t, acc)
  defp flatten([h | t], acc) when is_list(h), do: flatten(h, flatten(t, acc))
  defp flatten([h | t], acc), do: [h | flatten(t, acc)]
  defp flatten([], acc), do: acc
end
