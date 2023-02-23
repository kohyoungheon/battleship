require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @player =Player.new
    @cruiser = Ship.new('Cruiser', 3)
    @sub = Ship.new("Submarine", 2) 
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@player).to be_an_instance_of(Player)
      expect(@player.board).to be_an_instance_of(Board)
    end
  end

  describe '#lose?' do
    it 'returns a boolean whether player lost' do
    expect(@player.lose?).to eq(true)
    @player.board.place(@cruiser, ['A1', 'A2', 'A3'])
    @player.board.place(@sub, ['B1', 'B2'])

    expect(@player.lose?).to eq(false)
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    expect(@player.lose?).to eq(false)
    @sub.hit
    @sub.hit
    expect(@player.lose?).to eq(true)
    end
  end

  describe '#clear_board' do
    it 'resets the board' do
      board = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
      cleared = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      @player.board.place(@cruiser, ['A1', 'A2', 'A3'])
      expect(@player.board.render(true)).to eq(board)
      
      @player.clear_board
      expect(@player.board.render(true)).to eq(cleared)
    end
  end
end