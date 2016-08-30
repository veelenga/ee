defmodule Queens do
  @board_size 8
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white \\ {0, 3}, black \\ {7, 3}) do
    if white == black or not valid?(white) or not valid?(black) do
      raise ArgumentError
    end

    %Queens{black: black, white: white}
  end

  def valid?({x, y}) do
    x >= 0 and y >= 0 and x < @board_size and y < @board_size
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    Enum.map_join(0..(@board_size - 1), "\n", &(row &1, queens))
  end

  defp row(row, queens) do
    Enum.map_join(0..(@board_size - 1), " ", &(cell row, &1, queens))
  end

  defp cell(row, col, %{black: b, white: w}) do
    case {row, col} do
      ^b -> "B"
      ^w -> "W"
      _ -> "_"
    end
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%{black: {x1, y1}, white: {x2, y2}}) do
    x1 == x2 or y1 == y2 or abs(x1 - x2) == abs(y1 - y2)
  end
end
