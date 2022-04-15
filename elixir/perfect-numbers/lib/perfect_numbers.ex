defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number < 1,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    case number |> divisors() |> Enum.sum() do
      n when n < number -> {:ok, :deficient}
      n when n > number -> {:ok, :abundant}
      ^number -> {:ok, :perfect}
    end
  end

  defp divisors(1), do: []
  defp divisors(n), do: 1..(n - 1) |> Enum.filter(&(rem(n, &1) == 0))
end
