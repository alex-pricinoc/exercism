defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []) do
    Agent.start_link(fn -> {[], 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {list, _} -> list end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {list, id} ->
      plot = %Plot{plot_id: id, registered_to: register_to}
      {plot, {[plot | list], id + 1}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {list, id} -> {Enum.reject(list, &(&1.plot_id == plot_id)), id} end)
  end

  def get_registration(pid, plot_id) do
    Enum.find(
      list_registrations(pid),
      {:not_found, "plot is unregistered"},
      &(&1.plot_id == plot_id)
    )
  end
end
