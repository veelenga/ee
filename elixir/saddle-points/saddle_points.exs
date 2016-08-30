defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str |> String.split("\n") |> Enum.map(&to_list/1)
  end

  defp to_list(row) do
    row |> String.split(" ") |> Enum.map(&String.to_integer/1)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str |> rows |> transpose
  end

  defp transpose(m) do
    m |> List.zip |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows(str)
    columns = rows |> transpose

    rows
    |> Enum.with_index
    |> Enum.map(&max_in_rows/1)
    |> List.flatten
    |> Enum.filter(fn {i, j} -> min_in_column?(i, Enum.at(columns, j)) end)
  end

  defp max_in_rows({row, n}) do
    max = Enum.max(row)
    row
    |> Enum.with_index
    |> Enum.filter_map(fn {val, _} -> val == max end, fn {_, i} -> {n, i} end)
  end

  defp min_in_column?(y, column), do: Enum.at(column, y) == Enum.min(column)
end
