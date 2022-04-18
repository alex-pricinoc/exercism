defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise(ArgumentError, "must be greater than 0")

  def nth(count) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Enum.fetch!(count - 1)
  end

  defp prime?(2), do: true
  defp prime?(n), do: Enum.all?(2..(n - 1), &(rem(n, &1) != 0))
end
