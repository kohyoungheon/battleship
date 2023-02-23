class Player
  attr_reader :board
  
  def initialize
    @board = Board.new
  end

  def lose?
    @board.cells.each do |key,value|
      if (@board.cells[key].ship && @board.cells[key].ship.health != 0)
        return false
      end
    end
    return true
  end
  
  def clear_board
    @board = Board.new
  end
end