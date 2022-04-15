defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      sublist?(a, b) -> :superlist
      sublist?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: false

  defp sublist?([_ | t] = a, b) do
    List.starts_with?(a, b) or sublist?(t, b)
  end
end
