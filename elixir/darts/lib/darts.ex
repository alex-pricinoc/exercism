defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    distance = Darts.sqrt(x*x + y*y)
    cond do
       distance <= 1 -> 10
       distance <= 5 -> 5
       distance <= 10 -> 1
       true -> 0
    end
  end

  @spec sqrt(number :: number) :: float
  def sqrt(number) do
      :math.pow(number, 0.5)
  end
end
