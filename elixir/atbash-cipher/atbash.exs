defmodule Atbash do
  import String, only: [replace: 4, downcase: 1]
  import Enum, only: [map_join: 2, join: 2]

  @keys Enum.zip(?a..?z, ?z..?a)
    |> Enum.into(%{})
    |> Map.merge(Map.new ?0..?9, &{&1, &1})

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(text) do
    text
    |> replace(~r/[^a-zA-Z0-9]/, "", trim: true)
    |> downcase
    |> to_charlist
    |> map_join(&<<@keys[&1]>>)
    |> chunk(5)
    |> join(" ")
  end

  defp chunk(text, maxsize) do
    Regex.scan(~r/.{1,#{maxsize}}/, text) |> List.flatten
  end
end
