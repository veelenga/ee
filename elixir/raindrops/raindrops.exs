defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    { "", number }
      |> drop(3, "Pling") |> drop(5, "Plang") |> drop(7, "Plong")
      |> out
  end

  defp drop({acc, num}, p, s) when rem(num, p) == 0, do: {acc <> s, num}
  defp drop({acc, num}, _, _), do: {acc, num}

  defp out({acc, num}), do: if acc != "", do: acc, else: Integer.to_string num
end
