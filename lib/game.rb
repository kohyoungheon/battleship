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


    def computer_fire(cell)
      @player.board.cells[cell].fire_upon
      if @player.board.cells[cell].ship == nil
        puts 'Computer: "My shot on #{cell} was a miss."'
      elsif @player.board.cells[cell].ship != nil
        puts 'Computer: "My shot on #{cell} was a hit."'
        if @player.board.cells[cell].ship.sunk?
          puts 'Computer: "I sunk your #{@player.cells[cell].ship.name}!"'
        end
      end
    end
  
    def comp_picks_cell
      cell = @player.board.cells.values.sample(1)
      until cell(0).fire_upon? == false do
        cell = @player.board.values.sample(1)
      end
      computer_fire(cell[0].coordinate)
      cell[0].coordinate
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

    def player_place_cruiser
      user_cruiser = Ship.new("Cruiser",3)
      puts "Enter the squares for the Cruiser (3 spaces):"
      user_placement = gets.chomp.upcase.strip
      user_placement = user_placement.split(" ")
      if player.board.valid_placement?(user_cruiser, user_placement)
        @player.board.place(user_cruiser, user_placement)
        puts @player.board.render(true)
      else
        puts "Invalid placement. Please try again:"
        return player_place_cruiser
      end
    end

    def player_place_sub
      user_sub = Ship.new("Submarine",2)
      puts "Enter the squares for the Submarine (2 spaces):"
      user_placement2 = gets.chomp.upcase.strip
      user_placement2 = user_placement2.split(" ")
      if player.board.valid_placement?(user_sub, user_placement2)
        @player.board.place(user_sub, user_placement2)
        puts @player.board.render(true)
      else
       puts "Invalid placement. Please try again:"
      return player_place_sub
      end
    end

    def turn
      puts "******************************************"
      puts "THE GAME IS NOW STARTING!"
      puts "******************************************"
      puts "=============COMPUTER BOARD============="
      puts @computer.board.render
      puts "==============PLAYER BOARD=============="
      puts @player.board.render
    end


  def play
    comp_cruiser = Ship.new("Cruiser",3)
    comp_sub = Ship.new("Submarine",2)
    computer_placement(comp_cruiser)
    computer_placement(comp_sub)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player.board.render

    player_place_cruiser
    player_place_sub

    turn
  end

end