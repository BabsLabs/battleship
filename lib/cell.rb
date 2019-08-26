class Cell
  attr_reader :coordinate, :ship
  attr_writer :ship

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

  def render(show_ship = false)
    if show_ship == false

      if @fired_upon == false
        "."
      elsif @fired_upon == true && @ship == nil
        "M"
      elsif @ship.sunk? == true
        "X"
      elsif @fired_upon == true && @ship != nil
        "H"
      end

    elsif show_ship == true && @ship != nil
      "S"
    end
  end

end
