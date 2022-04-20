defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(~r/[, .]/, "")
    |> String.to_charlist()
    |> Stream.map(&encode_char/1)
    |> Stream.chunk_every(5)
    |> Stream.map(&to_string/1)
    |> Enum.join(" ")
  end

  defp encode_char(char) when char in ?0..?9, do: char
  defp encode_char(char), do: ?z - char + ?a

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(" ", "")
    |> String.to_charlist()
    |> Enum.map(&encode_char/1)
    |> Kernel.to_string()
  end
end
