defmodule ResistorColorTrio do
  @resistors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    [c1, c2, c3] = colors
    val = (@resistors[c1] * 10 + @resistors[c2]) * 10 ** @resistors[c3]
    if val >= 1000, do: {val / 1000, :kiloohms}, else: {val, :ohms}
  end
end
