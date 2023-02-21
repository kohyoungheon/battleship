require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

board = Board.new
cruiser = Ship.new("Cruiser", 3) 
board.place(cruiser, ["A1", "A2", "A3"])
puts board.render
puts board.render(true)