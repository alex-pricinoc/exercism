defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def increase_quantity(item, count) do
    quantity_by_size = Enum.into(item.quantity_by_size, %{}, fn {k, v} -> {k, v + count} end)
    %{item | quantity_by_size: quantity_by_size}
  end

  def total_quantity(%{quantity_by_size: quantity_by_size}) do
    Enum.reduce(quantity_by_size, 0, fn {_k, v}, acc -> v + acc end)
  end
end
