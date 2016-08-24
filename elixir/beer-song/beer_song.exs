defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(n) when n in (1..100) do
    {b, t, m} = case n - 1 do
      0 -> {"no more bottles", "Go to the store and buy some more", "99 bottles"}
      1 -> {"1 bottle", "Take it down and pass it around", "no more bottles"}
      2 -> {"2 bottles", "Take one down and pass it around", "1 bottle"}
      x -> {"#{x} bottles", "Take one down and pass it around", "#{x - 1} bottles"}
    end
    """
    #{String.capitalize b} of beer on the wall, #{b} of beer.
    #{t}, #{m} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    Enum.map_join(range, "\n", &verse/1)
  end
end
