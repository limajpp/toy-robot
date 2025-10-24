defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Table}

  def run([{:place, placement} | rest]) do
    nil
  end

  def run([_command | rest]) do
    nil
  end

  def run([]) do
    # Esta função sempre deve retornar nil
    nil
  end

  def run([{:invalid, _command} | rest], simulation) do
    nil
  end

  def run([:move | rest], simulation) do
    nil
  end

  def run([:turn_left | rest], simulation) do
    nil
  end

  def run([:turn_right | rest], simulation) do
    nil
  end

  def run([:report | rest], simulation) do
    nil
  end

  def run([], simulation) do
    nil
  end
end
