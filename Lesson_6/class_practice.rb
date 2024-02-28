# puts "Hello World"
#GAME OF WAR USING CLASSES PRACTICE

class Card
  attr_reader :number, :value, :suit
  def initialize(num, suit, value)
  @number = num
  @suit = suit
  @value = value
  end

  def display
    suit = "\u2660" if @suit == "spade"
    suit = "\u2665" if @suit == "heart"
    suit = "\u2663" if @suit == "club"
    suit = "\u2666" if @suit == "diamond"
    "#{@number} #{suit}"
  end

end

class Card_game_war
  def initialize
    @deck = build_deck
    @player1 = @deck[0..25]
    @player2 = @deck[26..51]
  end

  def build_deck
    num = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suit = %w[diamond heart spade club]
    num_value = (2..14).to_a
    hash_value = num.zip(num_value).to_h
    deck = []
    num.each do |n|
      suit.each do |s|
        deck << Card.new(n, s, hash_value[n])
      end
    end
    deck.shuffle
  end

  def play_game
    until @player1.length.zero? || @player2.length.zero? do
      p "Player 1 has #{@player1.length} card(s) left"
      p "Player 2 has #{@player2.length} card(s) left"
      p "press enter to start round"
      gets
      start_round
    end
    p "Player 1 has won" if @player2.length.empty?
    p "Player 2 has won" if @player1.length.empty?
  end

  def start_round
    card1 = @player1.pop
    card2 = @player2.pop
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

    p "player 1 has won round" if card1.value > card2.value
    return @player1.unshift(middle) if card1.value > card2.value

    p "player 2 has won round" if card2.value > card1.value
    return @player2.unshift(middle) if card2.value > card1.value

    p "=====DECLARING WAR========" if card2.value == card1.value
    4.times do
    card1 = @player1.pop
    card2 = @player2.pop
    middle << card2
    end
    war(middle)
  end
end


game = Card_game_war.new
game.play_game
