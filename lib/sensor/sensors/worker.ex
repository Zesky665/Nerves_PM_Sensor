defmodule Sensor.Worker do
 
# Client
  def start_link(options\\[]) do
    GenServer.start_link __MODULE__, [], options
  end

# Server
  def init(_) do
    IO.inspect("Test")
    {:ok, pid} = Nerves.UART.start_link
    Nerves.UART.open(pid, "ttyUSB0", speed: 9600, active: false)

    spawn(fn -> read_data_forever(pid) end)
    {:ok, []}
  end

  defp read_data_forever(pid) do
    {:ok, output} = Nerves.UART.read(pid, 5000)
    data = :binary.bin_to_list(output)
    pm25 = Enum.fetch!(data,2)
    pm10 = Enum.fetch!(data,4)

    #IO.inspect("The Data: PM2.5 = #{pm25}μg/m3 , PM10 = #{pm10}μg/m3")
    data = %{pm25: pm25, pm10: pm10}
    spawn(fn -> save_value(data) end)
    :timer.sleep(1000)
    read_data_forever(pid)
  end

  defp save_value(data) do
    Sensor.Data.create_value(data)
  end

end