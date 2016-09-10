defmodule Allergies do
  use Bitwise

  @allergens %{
    1   => :eggs,
    2   => :peanuts,
    4   => :shellfish,
    8   => :strawberries,
    16  => :tomatoes,
    32  => :chocolate,
    64  => :pollen,
    128 => :cats
  }

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    @allergens
    |> Enum.filter_map(&(flagged? flags, &1), fn {_, v} -> to_string(v) end)
  end

  defp flagged?(flags, {k, _}) do
    (flags &&& k) > 0
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    Enum.member?(list(flags), item)
  end
end
