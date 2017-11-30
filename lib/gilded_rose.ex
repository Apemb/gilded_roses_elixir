defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 8, quality: 3}]

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item) do
    case item do
      %Item{name: "Sulfuras, Hand of Ragnaros",
            sell_in: _, quality: _} ->
        item

      %Item{name: "Aged Brie",
            sell_in: sell_in, quality: quality} ->
        quality = if sell_in > 0, do: quality + 1, else: quality + 2
        quality = if quality > 50, do: 50, else: quality
        %Item{name: "Aged Brie",
              sell_in: sell_in - 1,
              quality: quality}

      %Item{name: "Backstage passes to a TAFKAL80ETC concert",
            sell_in: sell_in, quality: quality} ->
        quality = cond do
          sell_in <= 0 -> 0
          sell_in <= 5 -> quality + 3
          sell_in <= 10 -> quality + 2
          true -> quality + 1
        end
        quality = if quality > 50, do: 50, else: quality
        %Item{name: "Backstage passes to a TAFKAL80ETC concert",
              sell_in: sell_in - 1,
              quality: quality}

      %Item{name: name, sell_in: sell_in, quality: quality} ->
        quality = if sell_in > 0 do
          quality - 1
        else
          quality - 2
        end
        quality = if quality < 0, do: 0, else: quality
        %Item{name: name,
              sell_in: sell_in - 1,
              quality: quality}
    end
  end
end
