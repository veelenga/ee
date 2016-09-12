defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, rails) do
    str
    |> String.codepoints
    |> Enum.zip(rails-1 |> rail_mask |> Stream.cycle)
    |> Enum.reduce([], fn{x, r}, acc -> Keyword.update(acc,r,x,&(&1 <> x)) end)
    |> Keyword.values
    |> Enum.join
  end

  # 0, 1, 2, ...size -1, size, size - 1, ..., 2, 1
  defp rail_mask(size) when size < 1, do: [:"0"]
  defp rail_mask(size) do
    Enum.to_list(0..size) ++ Enum.to_list(size-1..1)
    |> Enum.map(&(&1 |> to_string |> String.to_atom))
  end

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, rails) do
    mask = rail_mask(rails - 1) |> Stream.cycle |> Enum.take(String.length str)
    encoded =
      mask
      |> Enum.with_index
      |> Enum.group_by(fn{r, _} -> r end)
      |> Map.values
      |> List.flatten

    str
    |> String.codepoints
    |> Enum.zip(Stream.cycle encoded)
    |> Enum.sort(&(elem((elem &1, 1), 1) < elem((elem &2, 1), 1)))
    |> Enum.map_join(fn {v, {_, _}} -> v end)
  end
end
