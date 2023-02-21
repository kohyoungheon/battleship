require './lib/spec_helper'

RSpec.describe Board do
  before(:each) do
    @game = Game.new
    @player = Board.new
    @computer = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new("Submarine", 2) 
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@game).to be_an_instance_of(Game)
      expect(@game.player).to be_an_instance_of(Board)
      expect(@game.computer).to be_an_instance_of(Board)
      expect(@game.submarine.name).to eq('Submarine')
      expect(@game.cruiser.name).to eq('Cruiser')
    end
  end


end