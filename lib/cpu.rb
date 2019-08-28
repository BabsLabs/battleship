class Cpu
  attr_reader :cpu_board

  def initialize(cpu_board)
    @cpu_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end


  def cpu_place_ships
    # makes a copy of the boards cells
    # cpu_cells = @cpu_board.cells.keys.shuffle
    # iterate through the ships
    # @ships.each do |ship_to_place|
   # make a loop that will keep validating some coordinates

   # now our cells copy is one element smaller
   # coord = cpu_cells.shift

  # @cpu_board.cells[coord].ship = ship_to_place
  # randomly pick horizontal/vertical
    # we have our single coord and an an array of all the possible coords so what if we take our coord and then randomly add an index position of +1 || -1 || +4 || -4

  # cpu_cells array keep choosing a new coord and shifting our array until it passes valid placement?

  # calculate the rest of the coords

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
