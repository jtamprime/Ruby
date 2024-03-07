require_relative "pieces"
require 'colorize'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    set_up_pieces
  end

  def display
    @grid.each_with_index do |row, i|
      row.each_with_index do |spot, j|

        background = :white if (i+j).even?
        background = :black if (i+j).odd?

        print "   ".colorize(background: background) if spot.nil?
        print spot.display.colorize(background: background) unless spot.nil?
      end
      puts
    end
  end

  def set_piece(piece, coordinate)
    row, column = coordinate

    @grid[row][column] = piece
  end

  def get_piece(coord)
    row, column = coord.chars.map(&:to_i)

    @grid[row][column]
  end

  def move_piece(start_coord, end_coord, whites_turn)
    start_row, start_column = start_coord.chars.map(&:to_i)
    end_row, end_column = end_coord.chars.map(&:to_i)

    piece = @grid[start_row][start_column]

    return false if piece.nil?
    return false if piece.color == 'black' && whites_turn
    return false if piece.color == 'white' && !whites_turn
    return false unless piece.valid_move?([end_row, end_column])

    @grid[start_row][start_column] = nil
    @grid[end_row][end_column] = piece
    piece.position = [end_row][end_column]
  end

  def in_check?(color)
    @grid.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        next if spot.nil?
        next unless spot.class == Pawn
        next if spot.color == color

        return true if spot.is_attacking?("#{i}#{j}")
      end
    end

    false
  end
end

def set_up_pieces
    (10..17).each do |coord|
      Pawn.new("black", coord.digits.reverse, self)
    end
    Rook.new("black", [0,0], self)
    Rook.new("black", [0,7], self)
    King.new("black", [0,4], self)
    Queen.new("black", [0,3], self)
    Knight.new("black", [0,1], self)
    Knight.new("black", [0,6], self)
    Bishop.new("black", [0,2], self)
    Bishop.new("black", [0,5], self)

    (60..67).each do |coord|
      Pawn.new("white", coord.digits.reverse, self)
    end
    Rook.new("white", [7,0], self)
    Rook.new("white", [7,7], self)
    King.new("white", [7,4], self)
    Queen.new("white", [7,3], self)
    Knight.new("white", [7,1], self)
    Knight.new("white", [7,6], self)
    Bishop.new("white", [7,2], self)
    Bishop.new("white", [7,5], self)
  end