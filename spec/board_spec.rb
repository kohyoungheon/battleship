require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
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
end