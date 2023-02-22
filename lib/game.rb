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
        puts "Computer: 'My shot on #{cell} was a miss.'"
      elsif @player.board.cells[cell].ship != nil
        puts "Computer: 'My shot on #{cell} was a hit.'"
        if @player.board.cells[cell].ship.sunk?
          puts "Computer: 'I sunk your #{@player.board.cells[cell].ship.name}!'"
        end
      end
    end
  
    def computer_turn
      cell = @player.board.cells.values.sample(1)
      if cell[0].fired_upon == true
        return computer_turn
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

    def player_turn
      user_fired = gets.chomp.upcase.strip
      if @computer.board.valid_coordinate?(user_fired) &&  @computer.board.cells[user_fired].fired_upon? == false
        @computer.board.cells[user_fired].fire_upon
        if @computer.board.cells[user_fired].ship
          puts "Your shot on #{user_fired} was a hit!"
          if @computer.board.cells[user_fired].ship.sunk?
            puts "You sunk my ship!"
          end

        else
          puts "Your shot on #{user_fired} missed!"
        end
        
      else
        puts "Please enter a valid coordinate."
        return player_turn
      end
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

    puts "******************************************"
    puts "THE GAME IS NOW STARTING!"
    puts "******************************************"
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render
    puts "Where would you like to fire?"


    player_turn
    computer_turn

    puts @computer.board.render(true)
    puts @player.board.render(true)

    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
    player_turn
    computer_turn
    puts @computer.board.render
    puts @player.board.render(true)
  end
end