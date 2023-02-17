require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new("Submarine", 2) 
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@board).to be_an_instance_of(Board)
    end
  end

  describe '#valid_coordinate?' do
    it 'can determine if a cell is within the valid coordinates' do
      expect(@board.valid_coordinate?('A1')).to be true
      expect(@board.valid_coordinate?('D4')).to be true
      expect(@board.valid_coordinate?('A5')).to be false
      expect(@board.valid_coordinate?('E1')).to be false
      expect(@board.valid_coordinate?('A22')).to be false
    end
  end

  describe '#valid_placement?' do
    it 'can determine if a ships placement is valid' do
      #number of coordinates in array should be same length as ship
      expect(@board.valid_placement?(@cruiser, ['A1', 'A2'])).to be false
      expect(@board.valid_placement?(@submarine, ['A1', 'A3', 'A4'])).to be false
      #coordinates are consecutive
      expect(@board.valid_placement?(@cruiser, ['A1', 'A2', 'A4'])).to be false
      expect(@board.valid_placement?(@submarine, ['A1', 'C2'])).to be false
      expect(@board.valid_placement?(@cruiser, ['A3', 'A2', 'A1'])).to be false
      expect(@board.valid_placement?(@submarine, ['C1', 'B1'])).to be false
      #coordinates cannot be diagonal
      expect(@board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])).to be false
      expect(@board.valid_placement?(@submarine, ['C2', 'C3'])).to be false
      #below should be valid if above passes
      expect(@board.valid_placement?(@cruiser, ['B1', 'C1', 'D1'])).to be true
      expect(@board.valid_placement?(@submarine, ['A1', 'A2'])).to be true
    end
  end
end