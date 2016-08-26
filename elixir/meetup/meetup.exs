defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday :: :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    case schedule do
      :first  -> 1..7
      :second -> 8..14
      :third  -> 15..21
      :fourth -> 22..28
      :last   -> :calendar.last_day_of_the_month(year, month)..22
      :teenth -> 13..19
    end |> find_date(year, month, weekday)
  end

  defp find_date(days, year, month, weekday) do
    {
      year, month,
      Enum.find(days, &(:calendar.day_of_the_week({year, month, &1}) == daynum(weekday)))
    }
  end

  defp daynum(weekday) do
    case weekday do
      :monday -> 1
      :tuesday -> 2
      :wednesday -> 3
      :thursday -> 4
      :friday -> 5
      :saturday -> 6
      :sunday -> 7
    end
  end
end
