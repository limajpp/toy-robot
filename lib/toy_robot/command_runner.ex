defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([{:place, placement} | rest]) do
    table = %Table{}

    case Simulation.place(table, placement) do
      {:ok, simulation} ->
        run(rest, simulation)
      {:error, _} ->
        run(rest)
    end
  end

  def run([_command | rest]) do
    run(rest)
  end

  def run([]) do
    # Esta função sempre deve retornar nil
    nil
  end

  def run([{:invalid, _command} | rest], simulation) do
    run(rest, simulation)
  end

  def run([:move | rest], simulation) do
    case Simulation.move(simulation) do
      {:ok, new_simulation} ->
        run(rest, new_simulation)
      {:error, _} ->
        run(rest, simulation)
    end
  end

  def run([:turn_left | rest], simulation) do
    {:ok, new_simulation} = Simulation.turn_left(simulation)
    run(rest, new_simulation)
  end

  def run([:turn_right | rest], simulation) do
    {:ok, new_simulation} = Simulation.turn_right(simulation)
    run(rest, new_simulation)
  end

  def run([:report | rest], simulation) do
    robot = Simulation.report(simulation)

    facing_str =
      case robot.facing do
        :north -> "norte"
        :south -> "sul"
        :east -> "leste"
        :west -> "oeste"
      end

    IO.puts("O robô está na posição (#{robot.x}, #{robot.y}) apontando para o #{facing_str}")

    run(rest, simulation)
  end

  def run([], simulation) do
    simulation
  end
end
