require 'spec_helper'

describe '#initialize' do
  it 'can initialize' do
    cell = Cell.new("A1")

    expect(cell).to be_instance_of(Cell)
    expect(cell.coordinate).to eq("A1")
    expect(cell.ship).to eq(nil)
    expect(cell.fired_upon).to eq(false)
    expect(cell.status).to eq('.')
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

  describe '#fire_upon' do
    it 'fires upon cell' do
      cell = Cell.new("A1")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq(false)
      expect(cell.ship.health).to eq(3)

      cell.fire_upon

      expect(cell.fired_upon?).to eq(true)
      expect(cell.ship.health).to eq(2)
    end
  end

  describe '#render' do

    before(:each) do
      @cell_1 = Cell.new("B4")
      @cell_2 = Cell.new("C3")
    end

    it 'outputs status of cell' do
      expect(@cell_1.render).to eq(".")
    end

    it 'checks for misses' do
      @cell_1.fire_upon
      expect(@cell_1.render).to eq("M")
    end

    it 'checks for hits' do
      cruiser = Ship.new("Cruiser", 3)
      @cell_2.place_ship(cruiser)

      expect(@cell_2.render).to eq(".")
      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
    end

  end
end