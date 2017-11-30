
defmodule GildedRoseTest do
  use ExUnit.Case

  test "Sulfuras is not updated" do
    expected_item = %Item{name: "Sulfuras, Hand of Ragnaros",
                           sell_in: 0, quality: 80}

    items = [expected_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Aged Brie gains 1 quality with time when sell_in positive" do
    expected_item = %Item{name: "Aged Brie",
                           sell_in: 10, quality: 1}
    initial_item = %Item{name: "Aged Brie",
                           sell_in: 11, quality: 0}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Aged Brie gains 2 quality with time when sell_in negative" do
    expected_item = %Item{name: "Aged Brie",
                           sell_in: -1, quality: 2}
    initial_item = %Item{name: "Aged Brie",
                           sell_in: 0, quality: 0}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Aged Brie cannot have quality over 50" do
    expected_item = %Item{name: "Aged Brie",
                           sell_in: -1, quality: 50}
    initial_item = %Item{name: "Aged Brie",
                           sell_in: 0, quality: 50}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Backstage gains 1 quality with time when sell_in over 10" do
    expected_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 10, quality: 1}
    initial_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 11, quality: 0}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Backstage gains 2 quality with time when sell_in over 5 and less than 10" do
    expected_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 5, quality: 2}
    initial_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 6, quality: 0}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Backstage gains 3 quality with time when sell_in over 0 and less than 5" do
    expected_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 0, quality: 3}
    initial_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 1, quality: 0}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Backstage quality equal 0 with time when sell_in is less than 0" do
    expected_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: -1, quality: 0}
    initial_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 0, quality: 10}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "Backstage quality cannot be over 50" do
    expected_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 10, quality: 50}
    initial_item = %Item{name: "Backstage passes to a TAFKAL80ETC concert",
                           sell_in: 11, quality: 50}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "standard object quality looses 1 point by time when sell_in positive" do
    expected_item = %Item{name: "+5 Dexterity Vest",
                           sell_in: 9, quality: 9}
    initial_item = %Item{name: "+5 Dexterity Vest",
                           sell_in: 10, quality: 10}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "standard object quality looses 2 point by time when sell_in negative" do
    expected_items = [%Item{name: "+5 Dexterity Vest",
                           sell_in: -1, quality: 8}]
    initial_items = [%Item{name: "+5 Dexterity Vest",
                           sell_in: 0, quality: 10}]

    items = initial_items |> GildedRose.update_quality()

    assert expected_items == items
  end

  test "conjured object quality looses 2 point by time when sell_in positive" do
    expected_item = %Item{name: "Conjured Mana Cake",
                           sell_in: 9, quality: 8}
    initial_item = %Item{name: "Conjured Mana Cake",
                           sell_in: 10, quality: 10}

    items = [initial_item] |> GildedRose.update_quality()

    assert [expected_item] == items
  end

  test "conjured object quality looses 4 point by time when sell_in negative" do
    expected_items = [%Item{name: "Conjured Mana Cake",
                           sell_in: -1, quality: 6}]
    initial_items = [%Item{name: "Conjured Mana Cake",
                           sell_in: 0, quality: 10}]

    items = initial_items |> GildedRose.update_quality()

    assert expected_items == items
  end
end
