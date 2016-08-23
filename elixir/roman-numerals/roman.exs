defmodule Roman do
  @romans %{
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
       9 => "IX",
       5 => "V",
       4 => "IV",
       1 => "I"
  }
  @nums @romans |> Map.keys |> Enum.sort(&(&1 > &2))

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) when number > 0 and number < 3001 do
    to_roman(number, "")
  end

  defp to_roman(number, acc) when number <= 0, do: acc
  defp to_roman(number, acc) do
    nearest = @nums |> Enum.find(&(number >= &1))
    to_roman(number - nearest, acc <> @romans[nearest])
  end
end
