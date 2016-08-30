defmodule Hexadecimal do
  @hex_table "0123456789abcdef" |> to_charlist |> Enum.with_index |> Enum.into(%{})

  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

    iex> Hexadecimal.to_decimal("invalid")
    0

    iex> Hexadecimal.to_decimal("af")
    175
  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    if valid?(hex) do
      hex
      |> String.downcase
      |> to_charlist
      |> Enum.reduce(0, &(&2 * 16 + @hex_table[&1]))
    else
      0
    end
  end

  defp valid?(hex) do
    String.match?(hex, ~r/^[0-9a-fA-F]+$/)
  end
end
