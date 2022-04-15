defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    cond do
      !sides_are_positive?(a, b, c) -> {:error, "all side lengths must be positive"}
      !triangle?(a, b, c) -> {:error, "side lengths violate triangle inequality"}
      a == b and b == c and a == c -> {:ok, :equilateral}
      a == b or b == c or a == c -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end

  @spec triangle?(number, number, number) :: true | false
  defp triangle?(a, b, c), do: a + b >= c and b + c >= a and a + c >= b

  @spec sides_are_positive?(number, number, number) :: true | false
  defp sides_are_positive?(a, b, c), do: a > 0 and b > 0 and c > 0
end
