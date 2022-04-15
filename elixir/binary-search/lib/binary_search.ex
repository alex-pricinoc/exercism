defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search({}, _, _, _), do: :not_found

  defp search(numbers, key, left_index, right_index) do
    middle_index = div(left_index + right_index, 2)
    middle_element = elem(numbers, middle_index)

    cond do
      key == middle_element ->
        {:ok, middle_index}

      left_index < right_index and middle_element < key ->
        search(numbers, key, middle_index + 1, right_index)

      left_index < right_index and middle_element > key ->
        search(numbers, key, left_index, middle_index - 1)

      true ->
        :not_found
    end
  end
end
