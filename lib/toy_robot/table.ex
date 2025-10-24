defmodule ToyRobot.Table do
  defstruct x_max: 4, y_max: 4

  alias ToyRobot.Table

  @doc """
  Determina se uma posição estaria dentro dos limites do tabuleiro

  ## Exemplo
    iex> alias ToyRobot.Table
    ToyRobot.Table
    iex> table = %Table{x_max: 4, y_max: 4}
    %Table{x_max: 4, y_max: 4}
    iex> table |> Table.valid_position?(%{x: 4, y: 4})
    true
    iex> table |> Table.valid_position?(%{x: 0, y: 0})
    true
    iex> table |> Table.valid_position?(%{x: 6, y: 0})
    false
  """
  def valid_position?(%Table{x_max: x_max, y_max: y_max}, %{x: x, y: y}) do
    x >= 0 and x <= x_max and y >= 0 and y <= y_max
  end
end
