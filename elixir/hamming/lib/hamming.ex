defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(s1, s2) when length(s1) != length(s2),
    do: {:error, "strands must be of equal length"}

  def hamming_distance(strand1, strand2) do
    {:ok, distance(strand1, strand2)}
  end

  defp distance([], []), do: 0
  defp distance([hd | tl1], [hd | tl2]), do: distance(tl1, tl2)
  defp distance([_ | tl1], [_ | tl2]), do: 1 + distance(tl1, tl2)
end
