class Cpu
  attr_reader :cpu_board
  def initialize(cpu_board)
    @cpu_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
    binding.pry
  end

  def place_ships
    @ship.each do |ship|


  end
end
end 
