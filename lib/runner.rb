require 'rspec'
require 'pry'
require '../lib/ship'
require '../lib/cell'
require '../lib/board'
require '../lib/game'
require '../lib/player'
require '../lib/computer'

player = Player.new
computer = Computer.new
game = Game.new(player, computer)
game.play