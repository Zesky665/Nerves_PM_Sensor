defmodule Sensor.DataTest do
  use Sensor.DataCase

  alias Sensor.Data

  describe "values" do
    alias Sensor.Data.Value

    @valid_attrs %{pm10: 42, pm25: 42}
    @update_attrs %{pm10: 43, pm25: 43}
    @invalid_attrs %{pm10: nil, pm25: nil}

    def value_fixture(attrs \\ %{}) do
      {:ok, value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_value()

      value
    end

    test "list_values/0 returns all values" do
      value = value_fixture()
      assert Data.list_values() == [value]
    end

    test "get_value!/1 returns the value with given id" do
      value = value_fixture()
      assert Data.get_value!(value.id) == value
    end

    test "create_value/1 with valid data creates a value" do
      assert {:ok, %Value{} = value} = Data.create_value(@valid_attrs)
      assert value.pm10 == 42
      assert value.pm25 == 42
    end

    test "create_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_value(@invalid_attrs)
    end

    test "update_value/2 with valid data updates the value" do
      value = value_fixture()
      assert {:ok, value} = Data.update_value(value, @update_attrs)
      assert %Value{} = value
      assert value.pm10 == 43
      assert value.pm25 == 43
    end

    test "update_value/2 with invalid data returns error changeset" do
      value = value_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_value(value, @invalid_attrs)
      assert value == Data.get_value!(value.id)
    end

    test "delete_value/1 deletes the value" do
      value = value_fixture()
      assert {:ok, %Value{}} = Data.delete_value(value)
      assert_raise Ecto.NoResultsError, fn -> Data.get_value!(value.id) end
    end

    test "change_value/1 returns a value changeset" do
      value = value_fixture()
      assert %Ecto.Changeset{} = Data.change_value(value)
    end
  end
end
