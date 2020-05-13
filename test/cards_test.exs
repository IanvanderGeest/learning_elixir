defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_hand() returns two random cards" do
    hand = Cards.create_hand()

    assert Enum.count(hand) == 2
  end
end
