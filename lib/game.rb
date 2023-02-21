class Game


  def initialize
    @player = Board.new
    @computer = Board.new
    @play_cruiser = Ship.new('Cruiser', 3)
    @comp_cruiser = Ship.new('Cruiser', 3)
    @play_sub = Ship.new('Submarine', 2)
    @comp_sub = Ship.new('Submarine', 2)
  end

end