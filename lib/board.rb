class Board

  attr_reader :cells
  
  def initialize
    @cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4')
      }
  end

  def valid_coordinate?(cell)
    @cells.keys.any?(cell)
  end
  
  def coordinate_letters(coordinates)
    coordinates.map do |coordinate|
      coordinate[0]
    end
  end
  
  def coordinate_numbers(coordinates)
    coordinates.map do |coordinate|
      coordinate[1].to_i
    end
  end
  
  def place(ship, coordinates)
    # require 'pry'; binding.pry
    # if valid_placement?(ship,coordinates) == true
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    # end
    # puts "Not valid"
  end
  
  def valid_placement?(ship,coord_array)
    if ship.length != coord_array.length
      return false
    end
    
    if coord_array.each do |coord|
      if @cells.keys.include?(coord)
        next
      end
      return false
    end

    coord_array.each do |coord|
      if @cells[coord].ship
        return false
      end
      next
    end

    
    first_coord_char_ord = coord_array[0][0].ord #=> 65
    first_coord_number_ord = coord_array[0][1].to_i #=> 1
    if ship.length == 3
      #Checks if letters match and numbers are consecutive
      if (first_coord_char_ord == coord_array[1][0].ord) && (first_coord_char_ord == coord_array[2][0].ord)
        if (first_coord_number_ord == (coord_array[1][1].to_i - 1)) && (first_coord_number_ord == (coord_array[2][1].to_i - 2))
          return true
        end
      end
      #Checks if letters are consecutive and numbers match
      if (first_coord_char_ord == (coord_array[1][0].ord - 1)) && (first_coord_char_ord == (coord_array[2][0].ord - 2))
        if (first_coord_number_ord == coord_array[1][1].to_i) && (first_coord_number_ord == (coord_array[2][1].to_i))
          return true
        end
      end
      false

    elsif ship.length == 2
      #Checks if letters match and numbers are consecutive.
      if first_coord_char_ord == coord_array[1][0].ord
        if first_coord_number_ord == (coord_array[1][1].to_i - 1)
          return true
        end
      end
      #Checks if letters are consecutive and numbers match.
      if first_coord_char_ord == (coord_array[1][0].ord - 1)
        if first_coord_number_ord == (coord_array[1][1].to_i)
          return true
        end
      end
      false
      end
    end
  end
  

  def render(default = false)
    if default == true
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    else
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    end
  end
end