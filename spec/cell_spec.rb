require 'spec_helper'

describe '#initialize' do
  it 'can initialize' do
    cell = Cell.new
    expect(cell).to be_instance_of(Cell)
  end
end