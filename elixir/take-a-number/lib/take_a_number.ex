defmodule TakeANumber do
  def state(value) do
    receive do
      {:report_state, caller} ->
        send(caller, value)
        state(value)

      {:take_a_number, caller} ->
        new_value = value + 1
        send(caller, new_value)
        state(new_value)

      :stop ->
        :ok

      _ ->
        state(value)
    end
  end

  def start() do
    spawn(fn -> state(0) end)
  end
end
