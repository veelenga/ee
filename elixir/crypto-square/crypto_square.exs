defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(str) do
    str
    |> normalize
    |> rectangle
    |> transpose
    |> out
  end

  defp normalize(str) do
    str
    |> String.replace(~r/\W/, "")
    |> String.downcase
  end

  defp rectangle(""), do: []
  defp rectangle(str) do
    count = String.length(str) |> :math.sqrt |> Float.ceil |> trunc
    str
    |> String.codepoints
    |> Enum.chunk(count, count, Stream.cycle([""]))
  end

  defp transpose(list) do
    list |> List.zip |> Enum.map(&Tuple.to_list(&1))
  end

  defp out(list) do
    Enum.map_join(list, " ", &Enum.join(&1))
  end
end
