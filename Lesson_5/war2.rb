def build_deck # build deck
  num = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suit = %w[D C H S]
  card_value = (2..14).to_a
  deck_hash = num.zip(card_value).to_h
  deck = []
  num.each do |n|
    suit.each do |s|
      deck << {
        "card_name" => "#{n}#{s}",
        "card_value" => deck_hash[n]
      }
    end
  end
  deck.shuffle
end

def run_game # deal deck, start the round, declare winner
  deck = build_deck
  player1 = deck[0..25]
  player2 = deck[26..51]
  round = 1
  until player1.empty? || player2.empty? do
    start_round(player1, player2, round)
    round+=1
  end
  p "Player 1 wins" if player2.empty?
  p "Player 2 wins" if player1.empty?
  p "total rounds played: #{round}"
end

def start_round(player1, player2, round) #let user know how many cards are left
  p "Next Round #{round}"
  p "Player 1 has #{player1.length} card(s) left."
  p "Player 2 has #{player2.length} card(s) left."
  p "Press enter to start round"
  gets

  middle = []
  card1 = player1.delete_at(0)
  card2 = player2.delete_at(0)
  middle << card1
  middle << card2

  play_war(player1, player2, middle)
end

def play_war(player1, player2, middle) #play and compare cards
  card1 = middle[-2]
  card2 = middle[-1]
  p "player 1 card is #{card1["card_name"]}"
  p "player 2 card is #{card2["card_name"]}"

  p "player 1 has won round" if card1["card_value"] > card2["card_value"]
  return player1.concat(middle) if card1["card_value"] > card2["card_value"]
  p "player 2 has won round" if card2["card_value"] > card1["card_value"]
  return player2.concat(middle) if card2["card_value"] > card1["card_value"]


p "=====DECLARING WAR======" if card1["card_value"] == card2["card_value"]
  4.times do
    card1 = player1.delete_at(0)
    card2 = player2.delete_at(0)
    middle << card1
    middle << card2
  end
  play_war(player1, player2, middle)


end

run_game