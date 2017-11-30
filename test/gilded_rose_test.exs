
defmodule GildedRoseTest do
  use ExUnit.Case
  alias GildedRoseTest.ItemFactory

  test "begin the journey of refactoring" do
    expect_items_to_be_identicals(50,
                                  ItemFactory.generateItems(),
                                  ItemFactory.generateItems())
  end

  def expect_items_to_be_identicals(0, legacy_items, items) do
    assert legacy_items == items
  end

  def expect_items_to_be_identicals(days, legacy_items, items) do
    expected_items = legacy_items
    |> GildedRoseLegacy.update_quality()

    items = items
    |> GildedRose.update_quality()

    assert expected_items == items

    expect_items_to_be_identicals(days - 1, expected_items, items)
  end
end
