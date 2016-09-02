defmodule Change do
  import Map
  import Enum, only: [sort: 1, filter: 2, reduce: 3]

  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    values
    |> sort
    |> filter(&(&1 <= amount and &1 > 0))
    |> change_for(amount)
    |> out(values)
  end

  defp change_for(values, amount) do
    reduce(values, new(0..amount, &{&1, %{size: 0}}), fn(c, acc) ->
      reduce c..amount, acc, fn(a, acc) ->
        m = acc[a - c]
        cond do
          c == a or m[:size] > 0 ->
            update! acc, a, fn _ ->
              m |> update(c, 1, &(&1 + 1)) |> update!(:size, &(&1 + 1))
            end
          true -> acc
        end
      end
    end) |> get(amount) |> drop([:size])
  end

  defp out(result, values) do
    cond do
      result == %{} -> :error
      true -> {:ok, new(values, &{&1, 0}) |> merge(result)}
    end
  end
end
