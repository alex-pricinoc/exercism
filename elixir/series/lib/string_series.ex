defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size < 1, do: []

  def slices(s, size), do: slices(s, size, String.length(s))

  def slices(_s, size, last) when last < size, do: []

  def slices(s, size, last) do
    slices(s, size, last - 1) ++ [String.slice(s, last - size, size)]
  end
end
