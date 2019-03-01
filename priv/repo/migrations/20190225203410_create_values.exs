defmodule Sensor.Repo.Migrations.CreateValues do
  use Ecto.Migration

  def change do
    create table(:values) do
      add :pm25, :integer
      add :pm10, :integer

      timestamps()
    end

  end
end
