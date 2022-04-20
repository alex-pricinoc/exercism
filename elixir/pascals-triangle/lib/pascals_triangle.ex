defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]

  def rows(1), do: [[1]]

  def rows(num) do
    Enum.reduce(2..num, [[1]], fn i, [prev_row | _] = acc ->
      [value(prev_row, i) | acc]
    end)
    |> Enum.reverse()
  end

  defp value(prev_row, num) do
    Enum.map(0..(num - 1), fn n ->
      at(prev_row, n - 1) + at(prev_row, n)
    end)
  end

  defp at(_, -1), do: 0
  defp at(list, index), do: Enum.at(list, index, 0)
end
