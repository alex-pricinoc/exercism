defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)

  def keep([], _), do: []

  def keep([h | t], fun) do
    case fun.(h) do
      true -> [h | keep(t, fun)]
      false -> keep(t, fun)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([], _), do: []

  def discard([h | t], fun) do
    case fun.(h) do
      true -> discard(t, fun)
      false -> [h | discard(t, fun)]
    end
  end
end
