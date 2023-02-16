class Cell
  attr_reader :coordinate,
              :ship, 
              :fired_upon,
              :status

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
    @fired_upon = true
    if @ship
      @ship.health -= 1
      @status = "H"
    else
      @status = "M"
    end
  end

  def render
    @status
  end
end