require "./lib/player"
class Cpu < Player


  def cpu_place_ships
    # makes a copy of the boards cells
    cpu_cells = @board.cells.keys.shuffle
    # iterate through the ships
    @ships.each do |ship_to_place|
      # make a loop that will keep validating some coordinates

      # now our cells copy is one element smaller
      # coord = cpu_cells.shift
      coord = ["A1", "A2"]
      # @board.cells[coord].ship = ship_to_place
      @board.cells["A1"].ship = ship_to_place
      @board.valid_placement?(ship_to_place, coord)
      # randomly pick horizontal/vertical


      # calculate the rest of the coords

      # place the ships
      # random_coordinates.valid_placement? == true
        # place ship_to_place on random_coordinates

    end
  end

end
