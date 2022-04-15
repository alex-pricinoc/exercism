defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    sqrt_iter(1, radicand)
  end

  defp sqrt_iter(guess, x) do
    if good_enough?(guess, x),
      do: trunc(guess),
      else: sqrt_iter(improve_guess(guess, x), x)
  end

  defp improve_guess(guess, x), do: average(guess, x / guess)

  defp average(x, y), do: (x + y) / 2

  defp good_enough?(guess, x), do: abs(square(guess) - x) < 0.001

  defp square(x), do: x * x
end
