defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""

  def recite([head | _tail] = strings), do: do_recite(strings, head, "")

  def do_recite([h1, h2 | tail], first, result),
    do: do_recite([h2 | tail], first, result <> "For want of a #{h1} the #{h2} was lost.\n")

  def do_recite([_h1], first, result), do: result <> "And all for the want of a #{first}.\n"
end
