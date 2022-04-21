defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(count_bottles(number))} of beer on the wall, #{count_bottles(number)} of beer.
    #{take_beer(number)}, #{count_bottles(number - 1)} of beer on the wall.
    """
  end

  defp count_bottles(0), do: "no more bottles"
  defp count_bottles(1), do: "1 bottle"
  defp count_bottles(-1), do: count_bottles(99)
  defp count_bottles(n), do: "#{n} bottles"
  defp take_beer(0), do: "Go to the store and buy some more"
  defp take_beer(1), do: "Take it down and pass it around"
  defp take_beer(_), do: "Take one down and pass it around"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0), do: Enum.map_join(range, "\n", &verse/1)
end
