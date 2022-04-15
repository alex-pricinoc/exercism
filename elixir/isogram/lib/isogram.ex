defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(""), do: true

  def isogram?(sentence) do
    sentence
    |> String.downcase()
    |> String.graphemes()
    |> Enum.filter(&Regex.match?(~r/\w/, &1))
    |> Enum.frequencies()
    |> Enum.all?(&(elem(&1, 1) === 1))
  end
end
