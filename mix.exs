defmodule GildedRose.Mixfile do
  use Mix.Project

  def project do
    [app: :gilded_rose,
     version: "0.0.1",
     elixir: "~> 1.4",
     deps: deps()]
  end

  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end
