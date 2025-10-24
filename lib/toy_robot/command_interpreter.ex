defmodule ToyRobot.CommandInterpreter do
  @doc """
  Interpreta comandos de uma lista de comandos, preparando-os para serem executados

  ## Exemplo

  ### Comandos válidos

    iex> alias ToyRobot.CommandInterpreter
    ToyRobot.CommandInterpreter
    iex> commands = ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    iex> commands |> CommandInterpreter.interpret()
    [
      {:place, %{x: 1, y: 2, facing: :north}},
      :move,
      :turn_left,
      :turn_right,
      :report
    ]

  ### Comandos inválidos
    iex> alias ToyRobot.CommandInterpreter
    ToyRobot.CommandInterpreter
    iex> commands = ["SPIN", "TWIRL", "EXTERMINATE"]
    ["SPIN", "TWIRL", "EXTERMINATE"]
    iex> commands |> CommandInterpreter.interpret()
    [
      {:invalid, "SPIN"},
      {:invalid, "TWIRL"},
      {:invalid, "EXTERMINATE"}
    ]
  """
  def interpret(commands) do
    Enum.map(commands, fn command -> do_interpret(command) end)
  end

  defp do_interpret("PLACE " <> rest) do
    parts = String.split(rest, ",")

    if length(parts) == 3 do
      x_str = Enum.at(parts, 0)
      y_str = Enum.at(parts, 1)
      facing_str = Enum.at(parts, 2)

      x_int = Integer.parse(x_str)
      y_int = Integer.parse(y_str)
      is_direction_valid = facing_str == "NORTH" or
        facing_str == "SOUTH" or
        facing_str == "EAST" or
        facing_str == "WEST"

      if x_int != :error and y_int != :error and is_direction_valid do
        {x, _} = x_int
        {y, _} = y_int

        downcase_facing = String.downcase(facing_str)
        facing_atom = String.to_atom(downcase_facing)

        {:place, %{x: x, y: y, facing: facing_atom}}
      else
        {:invalid, "PLACE " <> rest}
      end
    else
      {:invalid, "PLACE " <> rest}
    end
  end

  defp do_interpret("MOVE") do
    :move
  end

  defp do_interpret("LEFT") do
    :turn_left
  end

  defp do_interpret("RIGHT") do
    :turn_right
  end

  defp do_interpret("REPORT") do
    :report
  end

  defp do_interpret(command) do
    {:invalid, command}
  end
end
