defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: %{}
  def frequency(texts, workers) do
    parent = self()
    texts
    |> Enum.chunk(length(texts) / workers |> Float.ceil |> trunc)
    |> Enum.map(fn subtext ->
        spawn_link fn ->
          send parent, freq(subtext)
        end
      end)
    |> Enum.reduce(%{}, fn(_, acc) ->
        receive do result ->
          Map.merge(acc, result, fn(_, v1, v2) -> v1 + v2 end)
        end
      end)
  end

  defp freq(text) do
    text
    |> Enum.join
    |> String.downcase
    |> (&(Regex.scan ~r/\pL/u, &1)).()
    |> List.flatten
    |> Enum.reduce(%{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end
end
