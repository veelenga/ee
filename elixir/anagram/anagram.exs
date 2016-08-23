defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    with base <- String.downcase(base),
         foot <- footprint(base),
         anag <- candidates |> Enum.filter(&(anagram?(base, foot, &1))),
      do: anag
  end

  defp anagram?(base, base_footprint, candidate) do
    candidate = String.downcase candidate
    footprint(candidate) == base_footprint && candidate != base
  end

  defp footprint(word) do
    word
    |> String.to_charlist
    |> Enum.sort
  end
end
