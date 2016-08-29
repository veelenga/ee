defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number |> digits |> checksum(false, 0)
  end

  defp digits(number) do
    number
    |> String.to_integer
    |> Integer.digits
    |> Enum.reverse
  end

  defp checksum([], _, acc), do: acc
  defp checksum([h | t], false, acc), do: checksum(t, true, acc + h)
  defp checksum([h | t], true, acc) when h < 5, do: checksum(t, false, acc + h * 2)
  defp checksum([h | t], true, acc), do: checksum(t, false, acc + h * 2 - 9)

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number |> checksum |> rem(10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    v = number |> digits |> checksum(true, 0) |> rem(10)
    number <> to_string(rem 10 - v, 10)
  end
end
