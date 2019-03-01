defmodule SensorWeb.SensorChannel do
    use Phoenix.Channel
  
    def join("sensor:pm", _message, socket) do
      {:ok, socket}
    end

    def join("sensor:" <> _private_room_id, _params, _socket) do
      {:error, %{reason: "unauthorized"}}
    end

    def handle_in("update_pls", _params, socket)do
      value = Sensor.Data.last_value
        IO.inspect value.pm10
      {:reply, {:ok, %{pm10: value.pm10, pm25: value.pm25}}, socket}
    end
  end