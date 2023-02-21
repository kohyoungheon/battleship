class Game
  attr_reader :player, :board

  def initialize(player,computer)
    @player = player
    @computer = computer
  end

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    choice = gets.chomp.downcase
    play if choice == 'p'
    false
  end

    def valid?(ship)
      coord_array = []
      until @computer.board.valid_placement?(ship, coord_array) do
        coord_array = @computer.board.cells.keys.sample(ship.length)
      end
    coord_array
    end

    def computer_placement(ship)
      @computer.board.place(ship, valid?(ship))
    end

  def player_placement
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player.board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    user_cruiser = Ship.new("Cruiser",3)
    user_placement = gets.chomp.upcase.strip
    user_placement = user_placement.split(" ")
    @player.board.place(user_cruiser, user_placement)
    puts "Enter the squares for the Submarine (2 spaces):"
    puts @player.board.render(true)
  end

  def play
    comp_cruiser = Ship.new("Cruiser",3)
    comp_sub = Ship.new("Submarine",2)
    computer_placement(comp_cruiser)
    computer_placement(comp_sub)
    puts @computer.board.render
    player_placement

  end

end