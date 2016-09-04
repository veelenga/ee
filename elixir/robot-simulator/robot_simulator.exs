defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: { integer, integer }) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      not valid_direction?(direction) -> {:error, "invalid direction"}
      not valid_position?(position) -> {:error, "invalid position"}
      true -> %{direction: direction, position: position}
    end
  end

  defp valid_direction?(direction), do: direction in [:north, :east, :south, :west]
  defp valid_position?(position) do
    case position do
      {x, y} -> is_integer(x) and is_integer(y)
      _ -> false
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t ) :: any
  def simulate(robot, instructions) do
    instructions
    |> to_charlist
    |> Enum.reduce_while(robot, fn(cmd, robot) ->
      cond do
        cmd in [?R, ?L, ?A] -> {:cont, instruction(cmd, robot)}
        true -> {:halt, {:error, "invalid instruction"}}
      end
    end)
  end

  defp instruction(?R, robot) do
    %{ robot | direction:
      case robot.direction do
        :north -> :east
        :east  -> :south
        :south -> :west
        :west  -> :north
      end
    }
  end

  defp instruction(?L, robot) do
    %{ robot | direction:
      case robot.direction do
        :north -> :west
        :east  -> :north
        :south -> :east
        :west  -> :south
      end
    }
  end

  defp instruction(?A, robot = %{direction: d, position: {x, y}}) do
    %{ robot | position:
      case d do
        :north -> {x, y + 1}
        :east  -> {x + 1, y}
        :west  -> {x - 1, y}
        :south -> {x , y - 1}
      end
    }
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec position(robot :: any) :: { integer, integer }
  def position(robot), do: robot.position
end
