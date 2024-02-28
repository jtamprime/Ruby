puts "hello world"
gets

class Card

  def initialize(name, suit, value)
    @name = name
    @suit = suit
    @value = value
  end
  def name
    @name
  end
  def value
    @value
  end
  def display
    suit_symbol = "\u2660" if @suit == "spade"
    suit_symbol = "\u2665" if @suit == "hearts"
    suit_symbol = "\u2663" if @suit == "club"
    suit_symbol = "\u2666" if @suit == "diamond"

    "#{@name}#{suit_symbol}"
  end
end

class Card_game_war
  def initialize
    @deck = build_deck.shuffle
    @player1 = @deck[0..25]
    @player2 = @deck[26..51]
  end

    def build_deck
      num = %w[2 3 4 5 6 7 8 9 10 J Q K A]
      suit = %w[diamond club hearts spade]
      num_value = (2..14).to_a
      cards_hash = num.zip(num_value).to_h
      deck = []
      num.each do |n|
        suit.each do |s|
          card = Card.new("#{n}-#{s}", s, cards_hash[n])
          deck << card
        end
      end
      deck
    end

    def play_game
      round = 0
      until @player1.empty? || @player2.empty? do
        round+=1
        start_round(round)
      end

      p "Player 1 wins" if @player2.empty?
      p "Player 2 wins" if @player1.empty?
      p "number of rounds played #{round}"
    end

    def start_round(round)
      p "Player 1 has #{@player1.length} card(s) left"
      p "Player 2 has #{@player2.length} card(s) left"
      p "Next round is round #{round}"
      p "enter to start round"
      gets
      card1 = @player1.delete_at(0)
      card2 = @player2.delete_at(0)
      middle = []
      middle << card1
      middle << card2

      war(middle)

    end


    def war(middle)
     card1 = middle[-2]
      card2 = middle[-1]
      p "player 1 card is #{card1.display}"
      p "player 2 card is #{card2.display}"

      p "Player 1 wins round" if card1.value > card2.value
      return @player1.concat(middle) if card1.value > card2.value

      p "Player 2 wins round" if card2.value > card1.value
      return @player2.concat(middle) if card2.value > card1.value

      p "========DECLARE WAR=============" if card2.value == card1.value
      4.times do
        card1 = @player1.delete_at(0)
        card2 = @player2.delete_at(0)
        middle << card1
        middle << card2
      end
      war(middle)

    end
end
game = Card_game_war.new
game.play_game



