defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(letter) when letter >= ?A and letter <= ?Z do
    n = letter - 65
    size = n * 2 + 1

    Enum.map_join(0..(size - 1), "\n",
      fn row ->
        diff = abs(row - n)
        build_row(diff, ?A + abs(n - diff), size)
      end
    ) <> ("\n")
  end

  defp build_row(n, letter, size) do
    Enum.map_join 0..(size - 1),
      fn pos ->
        if pos == n or pos == size - n - 1, do: <<letter>>, else: " "
      end
  end
end
