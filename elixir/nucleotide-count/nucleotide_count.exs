defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless nucleotide_valid?(nucleotide) && strand_valid?(strand), do: raise ArgumentError

    strand |> Enum.count(&(nucleotide == &1))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    unless strand_valid?(strand), do: raise ArgumentError

    Map.new(@nucleotides, fn n -> {n, count(strand, n)} end)
  end

  defp nucleotide_valid?(nucleotide) do
    nucleotide in @nucleotides
  end

  defp strand_valid?(strand) do
    Enum.all? strand, &nucleotide_valid?(&1)
  end
end
