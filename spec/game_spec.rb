require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @player = Player.new
    @computer = Computer.new
    @board = Board.new
    @game = Game.new(@player, @computer)
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@game).to be_an_instance_of(Game)
      expect(@game.player).to be_an_instance_of(Player)
      expect(@game.computer).to be_an_instance_of(Computer)
      expect(@game.comp_cruiser.name).to eq('Cruiser')
      expect(@game.comp_sub.name).to eq('Submarine')
    end
  end

  describe '#valid?' do
    it 'can determine if a computers ship placement is valid' do
      coord_array = ['A2', 'B3', 'D4']
      expect(@board.valid_placement?(@game.comp_cruiser, coord_array)).to be false
      
      coord_array = @game.valid?(@game.comp_cruiser)
      expect(@game.computer.valid_placement?(@game.comp_cruiser, coord_array)).to be true

      coord_array = @game.valid?(@game.comp_sub)
      expect(@game.computer.valid_placement?(@game.comp_sub, coord_array)).to be true

    end
  end


end