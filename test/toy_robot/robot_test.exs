defmodule ToyRobot.RobotTest do
  alias ToyRobot.Robot
  use ExUnit.Case
  doctest ToyRobot.Robot

  describe "Quando o robô estiver apontando para o norte (cima)," do
    setup do
      {:ok, %{robot: %Robot{x: 0, y: 0, facing: :north}}}
    end

    test "movimente-o uma posição para esta direção", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == 0
    end

    test "movimente-o três posições para esta direção", %{robot: robot} do
      robot = robot |> Robot.move() |> Robot.move() |> Robot.move()
      assert robot.y == 3
    end

    test "gire-o no sentido anti-horário para apontar para a esquerda", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :west
    end

    test "gire-o no sentido horário para apontar para a direita", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :east
    end
  end

  describe "Quando o robô estiver apontando para o leste (direita)," do
    setup do
      {:ok, %{robot: %Robot{x: 0, y: 0, facing: :east}}}
    end

    test "movimente-o uma posição para esta direção", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == 1
    end

    test "movimente-o três posições para esta direção", %{robot: robot} do
      robot = robot |> Robot.move() |> Robot.move() |> Robot.move()
      assert robot.x == 3
    end

    test "gire-o no sentido anti-horário para apontar para o norte", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :north
    end

    test "gire-o no sentido horário para apontar para o sul", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :south
    end
  end

  describe "Quando o robô estiver apontando para o sul (baixo)," do
    setup do
      {:ok, %{robot: %Robot{x: 0, y: 0, facing: :south}}}
    end

    test "movimente-o uma posição para esta direção", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.y == -1
    end

    test "movimente-o três posições para esta direção", %{robot: robot} do
      robot = robot |> Robot.move() |> Robot.move() |> Robot.move()
      assert robot.y == -3
    end

    test "gire-o no sentido anti-horário para apontar para o leste", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :east
    end

    test "gire-o no sentido horário para apontar para o oeste", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :west
    end
  end

  describe "Quando o robô estiver apontando para o oeste (esquerda)," do
    setup do
      {:ok, %{robot: %Robot{x: 0, y: 0, facing: :west}}}
    end

    test "movimente-o uma posição para esta direção", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == -1
    end

    test "movimente-o três posições para esta direção", %{robot: robot} do
      robot = robot |> Robot.move() |> Robot.move() |> Robot.move()
      assert robot.x == -3
    end

    test "gire-o no sentido anti-horário para apontar para o sul", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :south
    end

    test "gire-o no sentido horário para apontar para o norte", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :north
    end
  end

  describe "Quando o robô está apontando para o norte (cima) e moveu anteriormente uma posição para esta direção," do
    setup do
      {:ok, %{robot: %Robot{x: 0, y: 1, facing: :north}}}
    end

    test "movimente-o para o norte uma posição.", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == 0
      assert robot.y == 2
      assert robot.facing == :north
    end

    test "gire-o no sentido horário para apontar para o leste.", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :east
      assert robot.y == 1
    end

    test "gire-o no sentido anti-horário para apontar para o oeste", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :west
      assert robot.y == 1
    end
  end

  describe "Quando o robô está apontando para o leste (direita) e moveu anteriormente uma posição para esta direção," do
    setup do
      {:ok, %{robot: %Robot{x: 1, y: 0, facing: :east}}}
    end

    test "movimente-o para o leste uma posição.", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == 2
      assert robot.y == 0
      assert robot.facing == :east
    end

    test "gire-o no sentido horário para apontar para o sul", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :south
      assert robot.x == 1
    end

    test "gire-o no sentido anti-horário para apontar para o norte", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :north
      assert robot.x == 1
    end
  end

  describe "Quando o robô está apontando para o sul (baixo) e moveu anteriormente uma posição para esta direção," do
    setup do
      {:ok, %{robot: %Robot{x: 0, y: -1, facing: :south}}}
    end

    test "movimente-o para o sul uma posição.", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == 0
      assert robot.y == -2
      assert robot.facing == :south
    end

    test "gire-o no sentido horário para apontar para o oeste", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :west
      assert robot.y == -1
    end

    test "gire-o no sentido anti-horário para apontar para o leste", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :east
      assert robot.y == -1
    end
  end

  describe "Quando o robô está apontando para o oeste (esquerda) e moveu anteriormente uma posição para esta direção," do
    setup do
      {:ok, %{robot: %Robot{x: -1, y: 0, facing: :west}}}
    end

    test "movimente-o para o oeste uma posição.", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.x == -2
      assert robot.y == 0
      assert robot.facing == :west
    end

    test "gire-o no sentido horário para apontar para o norte", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == :north
      assert robot.x == -1
    end

    test "gire-o no sentido anti-horário para apontar para o sul", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == :south
      assert robot.x == -1
    end
  end

  describe "Quando o robô está apontando para o norte e movimentou para o leste uma posição," do
    setup do
      {:ok, %{robot: %Robot{x: 1, facing: :north}}}
    end

    test "movimente-o para o norte uma posição", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.y == 1
      assert robot.x == 1
      assert robot.facing == :north
    end
  end

  describe "Quando o robô está apontando para o sul e movimentou para o leste uma posição," do
    setup do
      {:ok, %{robot: %Robot{x: 1, facing: :south}}}
    end

    test "movimente-o para o sul uma posição", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.y == -1
      assert robot.x == 1
      assert robot.facing == :south
    end
  end

  describe "Quando o robô está apontando para o norte e movimentou uma posição," do
    setup do
      {:ok, %{robot: %Robot{y: 1, facing: :north}}}
    end

    test "gire-o no sentido horário", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.y == 1
      assert robot.facing == :east
    end

    test "gire-o no sentido anti-horário", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.y == 1
      assert robot.facing == :west
    end
  end
end
