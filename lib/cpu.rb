class Cpu
  attr_reader :cpu_board

  def initialize(cpu_board)
    @cpu_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end

  def cpu_place_ships
    @ships.each do |ship_to_place|
      random_cells = []
      cpu_cells = @cpu_board.cells.keys

      until @cpu_board.valid_placement?(ship_to_place, random_cells) == true
        random_cells = cpu_cells.sample(ship_to_place.length)
      end
      @cpu_board.place(ship_to_place, random_cells)
    end
  end


end
