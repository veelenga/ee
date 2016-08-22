defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
      |> String.codepoints
      |> Enum.chunk_by(&(&1))
      |> Enum.map_join(&(Integer.to_string(Enum.count(&1)) <> List.first(&1)))
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
      |> String.replace(~r/(\d+[A-Z])/, "\\1 ")
      |> String.split(" ", trim: true)
      |> Enum.map(&(Integer.parse(&1)))
      |> Enum.map_join(fn({num, let}) -> String.pad_leading(let, num, let) end)
  end
end
