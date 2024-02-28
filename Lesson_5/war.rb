def deck_building
   numbers = %w[A K Q J T 9 8 7 6 5 4 3 2 ]
   suits = %w[D C S H]
   values  = (2..14).to_a.reverse

  value_hash = numbers.zip(values).to_h
  deck = []
  numbers.each do |n|
    suits.each do |s|
      deck << {
        "name" => "#{n}--#{s}",
        "value" => value_hash[n]
      }
    end
  end
  deck.shuffle
end

def run_game
  deck = deck_building

  player1 = deck[0..25]
  player2 = deck[26..51]

until player1.length == 0 || player2.length == 0  do
  play_round(player1, player2)
end

  return puts "YOU WIN" if player2.length == 0
  return puts "YOU LOSE" if player1.length == 0

end


def play_round(player1, player2)
  puts "you have #{player1.length} card(s) left"
  puts "you have #{player2.length} card(s) left"
  puts "press enter to play your card"
  gets


  card_1 = player1.delete_at(0)
  card_2 = player2.delete_at(0)

  middle = []
  middle << card_1
  middle << card_2

  play_war(middle, player1, player2)

end

def play_war(middle, player1, player2)
  card_1 = middle[-2]
  card_2 = middle[-1]

  puts "player 1 card is: #{card_1["name"]}"
  puts "player 2 card is: #{card_2["name"]}"

  puts "player 1 win round" if card_1["value"] > card_2["value"]
  return player1.concat(middle) if card_1["value"] > card_2["value"]

  puts "player 2 win round" if card_1["value"] < card_2["value"]
  return player2.concat(middle) if card_1["value"] < card_2["value"]


  puts "=========I declare WAR=========" if card_1["value"] == card_2["value"]
  4.times do
    middle << player1.delete_at(0)
    middle << player2.delete_at(0)
  end
  play_war(middle, player1, player2)

end
run_game



