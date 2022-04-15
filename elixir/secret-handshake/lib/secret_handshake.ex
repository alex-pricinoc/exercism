defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake

  Here's a couple of examples:

  Given the input 3, the function would return the array
  ["wink", "double blink"] because 3 is 11 in binary.

  Given the input 19, the function would return the array
  ["double blink", "wink"] because 19 is 10011 in binary.
  Notice that the addition of 16 (10000 in binary)
  has caused the array to be reversed.

  """
  use Bitwise

  @messages %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    cmd_list = for {bit, message} <- @messages, (code &&& bit) == bit, do: message
    if (code &&& 16) == 16, do: Enum.reverse(cmd_list), else: cmd_list
  end
end
