require 'colorize'

class ChessBoard
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    set_up_pieces
  end

  def display
    @board.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        background = :white if (i+j).even?
        background = :black if (i+j).odd?
        print "   ".colorize(background: background) if spot.nil?
        print spot.display.colorize(background: background) unless spot.nil?
      end
      puts
    end

  end

  def set_piece(piece, coordinates) # "12"
    row, column = coordinates.chars.map(&:to_i) # => row = 1, column = 2
    @board[row][column] = piece
  end

  def set_up_pieces
    (10..17).each do |coord|
      pawn = Pawn.new("white")
      set_piece(pawn, "#{coord}")
    end

    rook = Rook.new("white")
    set_piece(rook, "00")

    (60..67).each do |coord|
      set_piece(Pawn.new("black"), "#{coord}")
    end
  end
end

class Pawn
  def initialize(color)
    @color = color
  end

  def display
    return " \u265F ".colorize(color: :light_white) if @color == 'white'
    return " \u265F ".colorize(color: :light_black) if @color == 'black'
  end
end

class Rook
  def initialize(color)
    @color = color
  end

  def display
    return " \u265C ".colorize(color: :light_white) if @color == 'white'
    return " \u265C ".colorize(color: :light_black) if @color == 'black'
  end
end

b = ChessBoard.new
p b.display