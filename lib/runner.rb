require 'rspec'
require 'pry'
require '../lib/ship'
require '../lib/cell'
require '../lib/board'

board = Board.new
cruiser = Ship.new("Cruiser", 3) 
subs = Ship.new("Sub", 2)
board.place(cruiser, ["A1", "A2", "A3"])
board.place(subs, ["D3", "D2"])
puts board.render
puts board.render(true)