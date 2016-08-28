defmodule Binary do
  use Bitwise

  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string |> String.to_charlist |> to_decimal(0)
  end

  defp to_decimal([?1 | t], num), do: to_decimal(t, num * 2 + 1)
  defp to_decimal([?0 | t], num), do: to_decimal(t, num * 2)
  defp to_decimal([], num), do: num
  defp to_decimal(_, _), do: 0
end
