class Cell
  attr_reader :coordinate,
              :ship, 
              :fired_upon,
              :status
  attr_writer :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @status = "."
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @status == "H" || "M" || "X"
      @fired_upon = true
      if @ship
        @ship.health -= 1
        @status = "H"
      else
        @status = "M"
      end
    end
    puts
  end

  def render(default = false)
    if default == true && @fired_upon && @ship && (@ship.sunk? == false)
      @status = "H"
    elsif default == true && (@ship && @ship.sunk? == false)
      @status = "S"
    elsif @ship && @ship.sunk?
      @status = "X"
    elsif default == true && (@ship && @ship.sunk?)
      @status = "X"
    else
      @status
    end
  end
end