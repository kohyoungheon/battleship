class Board
  
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
    first_coord_char_ord = coord_array[0][0].ord #=> 65
    first_coord_number_ord = coord_array[0][1].ord #=> 1
    
    if ship.length == 3

      if (coord_array[1][0].ord ==  first_coord_char_ord + 1) && (coord_array[2][0].ord == first_coord_char_ord + 2)
        if (first_coord_number_ord == coord_array[1][1]) && (first_coord_number_ord == coord_array[2][1])
          return true
        end
      end
      if (coord_array[1][1].ord == first_coord_number_ord) && (coord_array[2][1].ord == first_coord_number_ord)
        if (first_coord_char_ord == (coord_array[1][0].ord-1)) && (first_coord_char_ord == (coord_array[2][0].ord-2))
          return true
        end
      end
      false

    elsif ship.length == 2

      if coord_array[1][0].ord ==  first_coord_char_ord
        if first_coord_number_ord == (coord_array[1][1].ord - 1)
          return true
        end
      end
      #checks numbers
      if coord_array[1][1].ord == first_coord_number_ord
        if first_coord_char_ord == (coord_array[1][0].ord - 1)
          return true
        end
      end
      false
      end
      
    end
  end
end