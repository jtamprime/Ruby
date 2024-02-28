def build_deck

deck_num = [
  "A",
  "K",
  "Q",
  "J",
  "10",
  "9",
  "8",
  "7",
  "6",
  "5",
  "4",
  "3",
  "2",
]

deck_suit = [
  "D",
  "C",
  "H",
  "S",
]


deck_array = []
deck_num.each do |n|
  deck_suit.each do |s|
    deck_array << "#{n}#{s}"
  end
end
deck_array

end

deck = build_deck.shuffle



def deal(deck)
  player1 = []
  player2 = []
  player3 = []
  player4 = []

  13.times do
    player1 << deck.delete_at(0)
  end
  13.times do
    player2 << deck.delete_at(0)
  end
  13.times do
    player3 << deck.delete_at(0)
  end
  13.times do
    player4 << deck.delete_at(0)
  end
  [player1, player2, player3, player4]
end

p deal(deck)
