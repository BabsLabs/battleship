class Cpu
  attr_reader :cpu_board

  def initialize(cpu_board)
    @cpu_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
  end

  def cpu_place_ships
    @ships.each do |ship|
      #something
    end
  end
end
