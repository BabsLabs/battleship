class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @ship&.hit
    @fired_upon = true
  end

  def render
    if @fired_upon == false
      "."
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship != nil # however this might override the X needed for a sunk ship
      "H"
    end
  end

  def show?
  end

end
