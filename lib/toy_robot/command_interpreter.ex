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
    nil
  end

  defp do_interpret("PLACE " <> rest) do
    nil
  end

  defp do_interpret("MOVE") do
    nil
  end

  defp do_interpret("LEFT") do
    nil
  end

  defp do_interpret("RIGHT") do
    nil
  end

  defp do_interpret("REPORT") do
    nil
  end

  defp do_interpret(command) do
    nil
  end
end
