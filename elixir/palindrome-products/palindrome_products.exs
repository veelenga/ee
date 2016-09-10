defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    for x <- min_factor..max_factor,
        y <- x..max_factor,
        product = x * y,
        palindromic?(product) do
          {product, [x, y]}
        end
    |> Enum.reduce(%{}, &add_factor/2)
  end

  defp add_factor({product, pair}, acc) do
    Map.update(acc, product, [pair], &(&1 ++ [pair]))
  end

  defp palindromic?(number) do
    digits = Integer.digits(number)
    Enum.reverse(digits) == digits
  end
end
