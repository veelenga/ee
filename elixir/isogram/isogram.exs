defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(s) do
    chars = s |> String.replace(~r/[ -]/, "") |> String.to_charlist
    length(chars) == length(Enum.uniq chars)
  end
end
