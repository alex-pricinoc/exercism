defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}

  def convert(_, _, base) when base <= 1, do: {:error, "output base must be >= 2"}
  def convert(_, base, _) when base <= 1, do: {:error, "input base must be >= 2"}

  def convert(digits, input_base, output_base) do
    if Enum.all?(digits, &valid_digits?(&1, input_base)) do
      {:ok, do_convert(digits, input_base, output_base)}
    else
      {:error, "all digits must be >= 0 and < input base"}
    end
  end

  defp valid_digits?(n, base), do: n >= 0 and n < base

  defp do_convert(digits, input_base, output_base) do
    digits
    |> to_decimal(input_base)
    |> from_decimal(output_base)
  end

  defp to_decimal(digits, base), do: Enum.reduce(digits, 0, fn x, acc -> acc * base + x end)

  defp from_decimal(0, _base), do: [0]
  defp from_decimal(number, base), do: from_decimal(number, base, [])

  defp from_decimal(0, _base, acc), do: acc
  defp from_decimal(n, base, acc), do: from_decimal(div(n, base), base, [rem(n, base) | acc])
end
