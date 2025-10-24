defmodule ToyRobot.CommandRunnerTest do
  use ExUnit.Case, async: true
  alias ToyRobot.{CommandRunner, Simulation}

  import ExUnit.CaptureIO

  test "Manipulando um comando PLACE válido" do
    %Simulation{robot: robot} = CommandRunner.run([{:place, %{x: 1, y: 2, facing: :north}}])

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :north
  end

  test "Manipulando um comando PLACE inválido" do
    simulation = CommandRunner.run([{:place, %{x: 10, y: 12, facing: :north}}])

    assert simulation == nil
  end

  test "Ignora comandos até um PLACE válido" do
    %Simulation{robot: robot} =
      CommandRunner.run([
        :move,
        {:place, %{x: 1, y: 2, facing: :north}}
      ])

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :north
  end

  test "Manipulando os comandos PLACE e MOVE" do
    %Simulation{robot: robot} =
      [
        {:place, %{x: 1, y: 2, facing: :north}},
        :move
      ]
      |> CommandRunner.run()

    assert robot.x == 1
    assert robot.y == 3
    assert robot.facing == :north
  end

  test "Manipulando os comandos PLACE e LEFT" do
    %Simulation{robot: robot} =
      [
        {:place, %{x: 1, y: 2, facing: :north}},
        :turn_left
      ]
      |> CommandRunner.run()

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :west
  end

  test "Manipulando os comandos PLACE e RIGHT" do
    %Simulation{robot: robot} =
      [
        {:place, %{x: 1, y: 2, facing: :north}},
        :turn_right
      ]
      |> CommandRunner.run()

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :east
  end

  test "Manipulando os comando PLACE e REPORT" do
    commands =
      [
        {:place, %{x: 1, y: 2, facing: :north}},
        :report
      ]

    output =
      capture_io(fn ->
        CommandRunner.run(commands)
      end)

    assert output |> String.trim() == "O robô está na posição (1, 2) apontando para o norte"
  end

  test "Manipulando os comandos PLACE e INVALID" do
    %Simulation{robot: robot} =
      [
        {:place, %{x: 1, y: 2, facing: :north}},
        {:invalid, "EXTERMINATION"}
      ]
      |> CommandRunner.run()

    assert robot.x == 1
    assert robot.y == 2
    assert robot.facing == :north
  end
end
