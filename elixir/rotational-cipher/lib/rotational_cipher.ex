defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.replace(text, ~r/[A-Za-z]/, fn <<char>> -> <<encode(char, shift)>> end)
  end

  defp encode(char, shift) when char in ?a..?z, do: rem(shift + (char - ?a), 26) + ?a
  defp encode(char, shift) when char in ?A..?Z, do: rem(shift + (char - ?A), 26) + ?A
end
