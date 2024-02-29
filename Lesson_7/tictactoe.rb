puts "hello world"

class Board
  def initialize
    @matrix = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil],
    ]
  end

  def display
    @matrix.each do |row|
      p row
    end
    nil
  end

  def update(coordinates, mark)
    row = coordinates[1]
    column = coordinates[0]

    @matrix[row][column] = mark
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end

  def diagonal_1
    [@matrix[0][0], @matrix[1][1], @matrix[2][2]]
  end

  def diagonal_2
    [@matrix[0][2], @matrix[1][1], @matrix[2][0]]
  end
end

class Game
  def initialize
    @board = Board.new
  end

  def play
    x_turn = true
    until winner do
      puts "give coordinates for your tic tac toe move"
      puts "type '0, 0' for the top left corner"
      puts "type '2, 0' for the top right corner"
      puts "type '2, 2' for the bottom right corner"
      puts "type '0, 2' for the bottom left corner"

      input = gets.chomp

      mark = "X" if x_turn
      mark = "O" unless x_turn
      # "0, 0" => [0,0]
      coordinates = input.split(",").map(&:strip).map(&:to_i)

      @board.update(coordinates, mark)

      @board.display

      x_turn = !x_turn
    end

    puts "#{winner} is the winner"
  end

  def winner
    @board.rows.each do |row|
      return row.first if row.uniq.count == 1 && !row.first.nil?
    end

    @board.columns.each do |column|
      return column.first if column.uniq.count == 1 && !column.first.nil?
    end

    diagonal_1 = @board.diagonal_1
    return diagonal_1.first if diagonal_1.uniq.count == 1 && !diagonal_1.first.nil?

    diagonal_2 = @board.diagonal_2
    return diagonal_2.first if diagonal_2.uniq.count == 1 && !diagonal_2.first.nil?

    false
  end
end

game = Game.new
game.play