defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
      |> String.downcase
      |> String.split(~r/[^[:alnum:]-]/u, trim: true)
      |> Enum.reduce(%{}, &match/2)
  end

  defp match(key, dic), do: Map.update(dic, key, 1, &(&1 + 1))
end
