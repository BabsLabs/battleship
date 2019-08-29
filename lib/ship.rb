# Make Ship class
class Ship
  # Ship attributes
  attr_reader :name,
              :length,
              :health

  # Initialization method
  def initialize(name, length)
    # Instance variables
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    # ship is sunk when health is zero
    if @health > 0
      # returns bool
      false
    else
      true
    end
  end

  # takes away 1 health from the ship
  def hit
    @health -= 1
  end

end
