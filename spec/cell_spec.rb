require 'spec_helper'

describe '#initialize' do
  it 'can initialize' do
    cell = Cell.new("A1")
    expect(cell).to be_instance_of(Cell)
    expect(cell.coordinate).to eq("A1")
  end

  describe '#empty?' do
    it 'returns boolean whether cell is empty' do
      cell = Cell.new("A1")
      expect(cell.empty?).to eq(true)
    end
  end

  describe '#place_ship' do
    it 'sets ship attribute to ship object' do
      cell = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end
  end
end