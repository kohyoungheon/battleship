require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @player = Player.new
    @computer = Computer.new
    @game = Game.new(@player,@computer)
    @comp_cruiser = Ship.new("Cruiser",3)
    @comp_sub = Ship.new("Submarine",2)
    @cruiser = Ship.new("Cruiser",3)
    @sub = Ship.new("Submarine",2)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@game).to be_an_instance_of(Game)
      expect(@game.player).to be_an_instance_of(Player)
      expect(@game.computer).to be_an_instance_of(Computer)
    end
  end

  describe "#welcome_message" do
    xit "displays the welcome message" do
      expect(@game.welcome_message).to eq(false)
    end
  end

  describe "#computer_placement" do
    it "places the computer's ship" do
      @game.computer_placement(@comp_cruiser)
      expect(@computer.board.render(true)).to include('S')

      @computer.clear_board
      @game.computer_placement(@comp_sub)
      expect(@computer.board.render(true)).to include('S')
    end
  end

  describe "#computer_fire" do
    it "fires a miss at player board" do
      @game.computer_fire("B2")
      fired_board = "  1 2 3 4 \nA . . . . \nB . M . . \nC . . . . \nD . . . . \n"
      expect(@player.board.render).to eq(fired_board)
      expect(@game.player.board.cells["B2"].fired_upon?).to eq(true)
      expect(@game.player.board.cells["C2"].fired_upon?).to eq(false)
    end

    it "fires a hit at player board" do
      @player.board.place(@cruiser, ['A1', 'A2', 'A3'])
      @game.computer_fire("A3")
      fired_board = "  1 2 3 4 \nA S S H . \nB . . . . \nC . . . . \nD . . . . \n"
      expect(@player.board.render(true)).to eq(fired_board)
    end
  end

  describe "#computer_turn" do
    it "fires a shot for the computer" do
      @game.computer_turn
      expect(@player.board.render).to include('M')
    end
  end

  describe '#player_turn' do
    xit "allows players to choose a cell to fire upon" do

    end
  end

  describe "player_place_sub" do
    xit "places the player's sub at user given location" do
      expect(@game.player_place_sub).to eq(false)
    end
  end

  describe "player_place_cruiser" do
    xit "places the player's cruiser at user given location" do
      expect(@game.player_place_cruiser).to eq(false)
    end
  end

  describe "play" do
    xit "play the game" do
      #try the game....I dont know what to tell you...
    end
  end

  describe "#valid?" do
    it "returns a valid coordinate" do
      expect(@game.valid?(@cruiser)).to be_an_instance_of(Array)
      expect(@game.valid?(@sub)).to be_an_instance_of(Array)
      expect(@game.valid?(@cruiser).length).to eq(3)
      expect(@game.valid?(@sub).length).to eq(2)

      cruiser_coord = @game.valid?(@cruiser)
      sub_coord = @game.valid?(@sub)

      expect(@player.board.render(true).include?("S")).to eq(false)
      @player.board.place(@cruiser,cruiser_coord)
      expect(@player.board.render(true).include?("S")).to eq(true)

      @player.clear_board

      expect(@player.board.render(true).include?("S")).to eq(false)
      @player.board.place(@sub,sub_coord)
      expect(@player.board.render(true).include?("S")).to eq(true)

    end
  end
end