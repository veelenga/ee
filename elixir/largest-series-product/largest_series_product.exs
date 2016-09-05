defmodule Series do

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(_, 0), do: 1
  def largest_product(number_string, size) do
    if size < 0 or size > String.length(number_string), do: raise ArgumentError

    number_string
    |> String.codepoints
    |> Enum.map(&String.to_integer(&1))
    |> products(size)
    |> Enum.max
  end

  defp products(digits, size) do
    digits
    |> Enum.chunk(size, 1)
    |> Enum.reduce([], &([product_of(&1) | &2]))
  end

  defp product_of(list) do
    Enum.reduce(list, 1, &(&1 * &2))
  end
end
