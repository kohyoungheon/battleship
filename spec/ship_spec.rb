require 'spec_helper'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cruiser).to be_an_instance_of(Ship)
      expect(@cruiser.name).to eq('Cruiser')
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
    end
  end

  describe '#sunk' do
    it 'can determine if a ship has sunk' do
      expect(@cruiser.sunk?).to be false
    end
  end

  describe '#hit' do
    it 'can determine if a ship was hit' do
      @cruiser.hit

      expect(@cruiser.health).to eq(2)
      expect(@cruiser.sunk?).to be false

      @cruiser.hit

      expect(@cruiser.health).to eq(1)
      expect(@cruiser.sunk?).to be false

      @cruiser.hit

      expect(@cruiser.health).to eq(0)
      expect(@cruiser.sunk?).to be true
    end
  end
end