require 'spec_helper'

describe '#initialize' do
  it 'can initialize' do
    cell = Cell.new("A1")

    expect(cell).to be_instance_of(Cell)
    expect(cell.coordinate).to eq("A1")
    expect(cell.ship).to eq(nil)
    expect(cell.fired_upon).to eq(false)
  end

  describe '#empty?' do
    it 'returns boolean whether cell is empty' do
      cruiser = Ship.new("Cruiser", 3)
      cell = Cell.new("A1")

      expect(cell.empty?).to eq(true)
      cell.place_ship(cruiser)
      expect(cell.empty?).to eq(false)
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

  describe '#fired_upon?' do
    it 'returns boolean whether cell is fired upon' do
      cell = Cell.new("A1")
      
      expect(cell.fired_upon?).to eq(false)
    end
  end
end