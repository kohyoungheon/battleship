require 'spec_helper'

RSpec.describe Computer do
  before(:each) do
    @computer = Computer.new
    @cruiser = Ship.new('Cruiser', 3)
    @sub = Ship.new("Submarine", 2) 
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@computer).to be_an_instance_of(Computer)
      expect(@computer.board).to be_an_instance_of(Board)
    end
  end

  describe '#lose?' do
    it 'returns a boolean whether computer lost' do
    expect(@computer.lose?).to eq(true)
    @computer.board.place(@cruiser, ['A1', 'A2', 'A3'])
    @computer.board.place(@sub, ['B1', 'B2'])

    expect(@computer.lose?).to eq(false)
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    expect(@computer.lose?).to eq(false)
    @sub.hit
    @sub.hit
    expect(@computer.lose?).to eq(true)
    end
  end

  describe '#clear_board' do
    it 'resets the board' do
      board = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
      cleared = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      @computer.board.place(@cruiser, ['A1', 'A2', 'A3'])
      expect(@computer.board.render(true)).to eq(board)
      
      @computer.clear_board
      expect(@computer.board.render(true)).to eq(cleared)
    end
  end
end