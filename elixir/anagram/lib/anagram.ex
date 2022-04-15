defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    with str <- normalized(base) do
      Enum.filter(candidates, &is_anagram?(normalized(&1), str))
    end
  end

  defp normalized(string), do: string |> String.downcase() |> to_charlist()

  defp is_anagram?(a, b), do: a != b and Enum.sort(a) == Enum.sort(b)
end
