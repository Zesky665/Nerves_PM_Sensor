defmodule Sensor.Data.Value do
  use Ecto.Schema
  import Ecto.Changeset


  schema "values" do
    field :pm10, :integer
    field :pm25, :integer

    timestamps()
  end

  @doc false
  def changeset(value, attrs) do
    value
    |> cast(attrs, [:pm25, :pm10])
    |> validate_required([:pm25, :pm10])
  end
end
