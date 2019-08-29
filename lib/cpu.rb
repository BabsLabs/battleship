class Cpu
  attr_reader :cpu_board

  def initialize(cpu_board)
    @cpu_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end

end
