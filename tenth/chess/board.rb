require_relative "pieces"


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
    row, column = coordinate.chars.map(&:to_i)

    @grid[row][column] = piece
  end

  def get_piece(coord)
    row, column = coord.chars.map(&:to_i)

    @grid[row][column]
  end

  def set_up_pieces
    (10..17).each do |coord|
      set_piece(Pawn.new("black"), coord.to_s)
    end
    set_piece(Rook.new("black"), "00")
    set_piece(Rook.new("black"), "07")
    set_piece(King.new("black"), "04")
    set_piece(Queen.new("black"), "03")
    set_piece(Bishop.new("black"), "02")
    set_piece(Bishop.new("black"), "05")
    set_piece(Knight.new("black"), "01")
    set_piece(Knight.new("black"), "06")

    (60..67).each do |coord|
      set_piece(Pawn.new("white"), coord.to_s)
    end

    set_piece(Rook.new("white"), "70")
    set_piece(Rook.new("white"), "77")
    set_piece(King.new("white"), "74")
    set_piece(Queen.new("white"), "73")
    set_piece(Bishop.new("white"), "72")
    set_piece(Bishop.new("white"), "75")
    set_piece(Knight.new("white"), "71")
    set_piece(Knight.new("white"), "76")
  end

  def move_piece(start_coord, end_coord, whites_turn)
    start_row, start_column = start_coord.chars.map(&:to_i)
    end_row, end_column = end_coord.chars.map(&:to_i)

    piece = @grid[start_row][start_column]

    return false if piece.nil?
    return false if piece.color == 'black' && whites_turn
    return false if piece.color == 'white' && !whites_turn
    return false unless piece.valid_move?(start_coord, end_coord, self)

    @grid[start_row][start_column] = nil
    @grid[end_row][end_column] = piece
  end

  def in_check?(color)
    @grid.each_with_index do |row, i|
      row.each_with_index do |spot, j|
        next if spot.nil?
        next unless spot.class == Pawn
        next if spot.color == color

        return true if spot.is_attacking?("#{i}#{j}", self)
      end
    end

    false
  end
end

