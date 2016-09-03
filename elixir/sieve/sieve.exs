defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    stream()
    |> Stream.take_while(&(&1 < limit))
    |> Enum.to_list
  end


  defp stream do
    Stream.unfold [], fn primes ->
      next = next_prime(primes)
      { next, [next | primes] }
    end
  end

  defp next_prime([]), do: 2
  defp next_prime(primes) when is_list primes do
    primes |> next_primes(1) |> List.first
  end
  defp next_primes(primes, quantity) when is_list primes and is_integer quantity do
    from = List.first(primes) + 1
    Stream.iterate(from, &(&1 + 1))
    |> Stream.drop_while(fn number ->
         Enum.any?(primes, fn prime ->
           rem(number, prime) == 0
         end )
       end )
    |> Enum.take(quantity)
  end
end
