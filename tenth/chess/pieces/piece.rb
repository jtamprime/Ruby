class Piece
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def display
    colorize_color = @color == "white" ? :light_white : :light_black
    return " #{picture} ".colorize(color: colorize_color)
  end

  def picture
    "?"
  end
end

