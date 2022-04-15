defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    Enum.reduce(keys(path), data, fn k, acc -> acc[k] end)
  end

  def get_in_path(data, path) do
    get_in(data, keys(path))
  end

  defp keys(path), do: String.split(path, ".")
end
