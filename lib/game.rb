class Game


  def initialize
    @player = Board.new
    @computer = Board.new
    @player_cruiser = Ship.new('Cruiser', 3)
    @comp_cruiser = Ship.new('Cruiser', 3)
    @player_sub = Ship.new('Submarine', 2)
    @comp_sub = Ship.new('Submarine', 2)
  end

  def computer_fire(cell)
    @player.board.cells[cell].fire_upon
    if @player.board.cells[cell].ship == nil
      puts 'My shot on #{cell} was a miss.'
    elsif @player.board.cells[cell].ship != nil
      puts 'My shot on #{cell} was a hit.'
      if @player.board.cells[cell].ship.sunk?
        puts 'I sunker your #{@player.cells[cell].ship.name}!'
      end
    end
  end

  def comp_picks_cell
    cell = @player.board.cells.values.sample(1)
    until cell(0).fire_upon? == false do
      cell = @player.board.values.sample(1)
    end
    computer_fire(cell[0].coordinate)
    cell[0].coordinate
  end
end