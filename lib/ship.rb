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

  # sunk? method
  def sunk?
    # sinks ship when health is zero
    if @health > 0
      # returns bool
      false
    else
      true
    end
  end

  # hit method for -1 health
  def hit
    @health -= 1
  end

end
