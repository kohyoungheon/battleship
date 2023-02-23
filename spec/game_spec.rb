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
    it "displays the welcome message" do
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

  describe "#computer_turn" do
    it "fires a shot for the computer" do
      @game.computer_turn
      expect(@player.board.render).to include('M')
    end
  end

  # describe "player_place_sub" do
  #   it "places the player's sub at user given location" do
  #     @game.player_place_sub
  #   end
  # end

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