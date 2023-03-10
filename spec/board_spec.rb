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
      expect(@board.valid_placement?(@submarine, ['A1', 'C1'])).to be false
      expect(@board.valid_placement?(@cruiser, ['A3', 'A2', 'A1'])).to be false
      expect(@board.valid_placement?(@submarine, ['C1', 'B1'])).to be false
      #coordinates cannot be diagonal
      expect(@board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])).to be false
      expect(@board.valid_placement?(@submarine, ['C2', 'D3'])).to be false
      #below should be valid if above passes
      expect(@board.valid_placement?(@cruiser, ['A1', 'B1', 'C1'])).to be true
      expect(@board.valid_placement?(@cruiser, ['A2', 'A3', 'A4'])).to be true
      expect(@board.valid_placement?(@submarine, ['C4', 'D4'])).to be true
      expect(@board.valid_placement?(@submarine, ['A4', 'B4'])).to be true
      expect(@board.valid_placement?(@submarine, ['B2', 'C2'])).to be true
      expect(@board.valid_placement?(@submarine, ['D4', 'D5'])).to be false
    end
  end

  #@board.place test
  describe '#place' do
    it 'can place a ship on the board' do
      @board.place(@cruiser, ['A1', 'A2', 'A3'])

      expect(@board.cells['A1'].ship).to eq(@cruiser)
      expect(@board.cells['A2'].ship).to eq(@cruiser)
      expect(@board.cells['A3'].ship).to eq(@cruiser)
      expect(@board.cells['A3'].ship).to eq(@board.cells['A2'].ship)

      @board.place(@submarine, ['B1', 'B2'])
      expect(@board.cells['B1'].ship).to eq(@submarine)
      expect(@board.cells['B2'].ship).to eq(@submarine)
      expect(@board.cells['B1'].ship).to eq(@board.cells['B2'].ship)
    end
  end

  #overlap? test
  it 'can determine if ships are overlapping' do
    @board.place(@cruiser, ['A1', 'A2', 'A3'])
    valid = @board.valid_placement?(@submarine, ["A1", "B1"])
    valid_2 = @board.valid_placement?(@submarine, ["A1", "A2"])
    valid_3 = @board.valid_placement?(@submarine, ["A3", "A4"])
    valid_4 = @board.valid_placement?(@submarine, ["B3", "B4"])
    expect(valid).to eq(false)
    expect(valid_2).to eq(false)
    expect(valid_3).to eq(false)
    expect(valid_4).to eq(true)
  end
  
  describe '#render' do
    it 'can render' do
      @board.place(@cruiser, ['A1', 'A2', 'A3'])
      board_1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      board_2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

      expect(@board.render).to eq(board_1)
      expect(@board.render(true)).to eq(board_2)
    end
  end
end


