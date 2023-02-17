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
end