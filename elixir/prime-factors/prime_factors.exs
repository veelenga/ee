defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    factors_for(number, 2, []) |> Enum.reverse
  end

  defp factors_for(1, _, acc), do: acc
  defp factors_for(n, cur, acc) when n < cur * cur, do: [n | acc]
  defp factors_for(number, cur, acc) when rem(number, cur) == 0 do
    factors_for(div(number, cur), cur, [cur | acc])
  end
  defp factors_for(number, cur, acc), do: factors_for(number, cur + 1, acc)
end
