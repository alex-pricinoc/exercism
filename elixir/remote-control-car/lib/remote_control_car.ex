defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %__MODULE__{nickname: "none"}
  end

  def new(nickname) do
    %__MODULE__{nickname: nickname}
  end

  def display_distance(%__MODULE__{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%__MODULE__{battery_percentage: 0}), do: "Battery empty"

  def display_battery(%__MODULE__{battery_percentage: percentage}),
    do: "Battery at #{percentage}%"

  def drive(%__MODULE__{battery_percentage: 0} = remote_car), do: remote_car

  def drive(
        %__MODULE__{
          battery_percentage: percentage,
          distance_driven_in_meters: distance
        } = remote_car
      ) do
    %{remote_car | battery_percentage: percentage - 1, distance_driven_in_meters: distance + 20}
  end
end
