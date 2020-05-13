defmodule Cards do
  @moduledoc """
    Module for creating a deck of cards, shuffling and dealing it
  """

  @doc """
    Returns a list of playing cards

  ## Examples
      iex> Cards.create_deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles and returns a new deck

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.shuffle_deck(deck)
  """
  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Shuffles deck and returns two random cards

  ## Examples
      iex(1)> deck = Cards.create_deck
      iex(2)> Cards.deal(deck)
  """
  def deal(deck) do
    shuffled = shuffle_deck(deck)

    {hand, _rest} = Enum.split(shuffled, 2)

    hand
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _enoent} -> "File does not exist"
    end
  end

  def create_hand do
    create_deck()
    |> shuffle_deck()
    |> deal()
  end
end
