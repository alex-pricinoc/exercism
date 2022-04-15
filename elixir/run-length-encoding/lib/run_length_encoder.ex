defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.reduce(
      "",
      fn chunk, acc ->
        acc <> num(Enum.count(chunk)) <> List.first(chunk)
      end
    )
  end

  defp num(1), do: ""
  defp num(n), do: to_string(n)

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.split(~r/(\d+|[A-Za-z])/, include_captures: true, trim: true)
    |> do_decode("", 1)
  end

  defp do_decode([], acc, _), do: acc

  defp do_decode([head | tail], acc, count) do
    case Integer.parse(head) do
      {n, _} -> do_decode(tail, acc, n)
      :error -> do_decode(tail, acc <> String.duplicate(head, count), 1)
    end
  end
end
