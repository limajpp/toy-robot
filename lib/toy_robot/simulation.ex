defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Simulation, Table}
  defstruct [:table, :robot]

  @doc """
  Simula o posicionamento do robô no tabuleiro

  ## Exemplo

  ### Quando o robô é posicionado em uma posição válida

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> Simulation.place(table, %{x: 0, y: 0, facing: :north})
    {
      :ok,
      %Simulation {
        table: table,
        robot: %Robot{x: 0, y: 0, facing: :north}
      }
    }

  ### Quando o robô é posicionado em uma posição inválida

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> Simulation.place(table, %{x: 6, y: 0, facing: :north})
    {:error, :invalid_placement}
  """
  def place(table, placement) do
    if Table.valid_position?(table, placement) do
      robot = %Robot{x: placement.x, y: placement.y, facing: placement.facing}
      {:ok, %Simulation{table: table, robot: robot}}
    else
      {:error, :invalid_placement}
    end
  end

  @doc """
  Movimenta o robô um espaço da direção que ele está apontando, a menos que essa posição esteja além dos limites do tabuleiro.

  ## Exemplo

  ### Um movimento válido
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation {
    ...>   table: table,
    ...>   robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.move
    {:ok, %Simulation{
      table: table,
      robot: %Robot{x: 0, y: 1, facing: :north}
    }}

  ### Um movimento inválido
    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation {
    ...>   table: table,
    ...>   robot: %Robot{x: 0, y: 4, facing: :north}
    ...> }
    iex> simulation |> Simulation.move
    {:error, :at_table_boundary}
  """
  def move(%Simulation{robot: robot, table: table} = simulation) do
    new_robot = Robot.move(robot)

    if Table.valid_position?(table, new_robot) do
      {:ok, %{simulation | robot: new_robot}}
    else
      {:error, :at_table_boundary}
    end
  end

  @doc """
  Gira o robô no sentido anti-horário (esquerda)

  ## Exemplo

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation{
    ...>   table: table,
    ...>   robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.turn_left
    {
      :ok,
      %Simulation {
        table: table,
        robot: %Robot{x: 0, y: 0, facing: :west}
      }
    }
  """
  def turn_left(%Simulation{robot: robot} = simulation) do
    new_robot = Robot.turn_left(robot)
    {:ok, %{simulation | robot: new_robot}}
  end

  @doc """
  Gira o robô no sentido horário (direita)

  ## Exemplo

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation{
    ...>   table: table,
    ...>   robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.turn_right
    {
      :ok,
      %Simulation {
        table: table,
        robot: %Robot{x: 0, y: 0, facing: :east}
      }
    }
  """
  def turn_right(%Simulation{robot: robot} = simulation) do
    new_robot = Robot.turn_right(robot)
    {:ok, %{simulation | robot: new_robot}}
  end

  @doc """
  Exibir a posição atual do robô

  ## Exemplo

    iex> alias ToyRobot.{Robot, Table, Simulation}
    [ToyRobot.Robot, ToyRobot.Table, ToyRobot.Simulation]
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> simulation = %Simulation{
    ...>   table: table,
    ...>   robot: %Robot{x: 0, y: 0, facing: :north}
    ...> }
    iex> simulation |> Simulation.report
    %Robot{x: 0, y: 0, facing: :north}
  """
  def report(%Simulation{robot: robot}) do
    robot
  end
end
