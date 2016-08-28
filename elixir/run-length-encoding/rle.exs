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
    Regex.scan(~r/(\w)\1*/, string, capture: :first)
    |> List.flatten
    |> Enum.map_join(&(to_string(String.length(&1)) <> String.first(&1)))
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\pL)/, string, capture: :all_but_first)
    |> Enum.map_join(fn [num, let] ->
        String.pad_leading(let, String.to_integer(num), let)
      end)
  end
end
