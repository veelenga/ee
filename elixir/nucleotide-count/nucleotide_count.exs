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

    Enum.count(strand, &(nucleotide == &1))
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

    Map.new(@nucleotides, &{&1, count(strand, &1)})
  end

  defp nucleotide_valid?(nucleotide), do: nucleotide in @nucleotides
  defp strand_valid?(strand), do: Enum.all? strand, &nucleotide_valid?/1
end
