defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      is_question?(input) and is_shouting?(input) -> "Calm down, I know what I'm doing!"
      is_question?(input) -> "Sure."
      is_shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_question?(input), do: String.ends_with?(String.trim(input), "?")
  defp is_shouting?(input), do: String.upcase(input) == input and is_text?(input)
  defp is_text?(input), do: String.upcase(input) != String.downcase(input)
end
