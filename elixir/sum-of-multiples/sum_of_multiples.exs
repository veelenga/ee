defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
      |> Enum.reduce([], &(scores(limit, &1, &1, &2)))
      |> Enum.uniq
      |> Enum.sum
  end

  defp scores(limit, _factor, multiplier, acc) when limit <= multiplier, do: acc
  defp scores(limit,  factor, multiplier, acc) do
    scores(limit, factor, multiplier + factor, [multiplier | acc])
  end
end
