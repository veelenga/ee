defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(n) do
    upto = n * round :math.log(n) + 2
    sieve(n, 0, nil, Enum.to_list 2..upto)
  end

  defp sieve(n, count, value, _) when count >= n, do: value
  defp sieve(n, count, _, [h | t]) do
    sieve(n, count + 1, h, Enum.reject(t, &(rem(&1, h) == 0)))
  end
end
