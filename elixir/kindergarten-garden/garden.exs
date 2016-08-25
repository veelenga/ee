defmodule Garden do
  @plants %{ ?R => :radishes, ?C => :clover, ?G => :grass, ?V => :violets }
  @default_students [
    :alice, :bob, :charlie, :david,
    :eve, :fred, :ginny, :harriet,
    :ileana, :joseph, :kincaid, :larry
  ]
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_students) do
    arrangement student_names |> Enum.sort,
      group_plants(info_string),
      Map.new(student_names, &{&1, {}})
  end

  defp arrangement([], _, acc), do: acc
  defp arrangement(_, [], acc), do: acc
  defp arrangement([s | students], [p | plants], acc) do
    arrangement(students, plants, Map.put(acc, s, p))
  end

  defp group_plants(str) do
    str
    |> String.split("\n")
    |> Enum.map(&parse_raw/1)
    |> List.zip
    |> Enum.map(fn {f, l} -> List.to_tuple(f ++ l) end)
  end

  defp parse_raw(raw) do
    raw
    |> String.to_charlist
    |> Enum.map(&(@plants[&1]))
    |> Enum.chunk(2)
  end
end
