class Board
  attr_reader :cells
  def initialize
    @cells = {
                   "A1" => Cell.new("A1"),
                   "A2" => Cell.new("A2"),
                   "A3" => Cell.new("A3"),
                   "A4" => Cell.new("A4"),
                   "B1" => Cell.new("B1"),
                   "B2" => Cell.new("B2"),
                   "B3" => Cell.new("B3"),
                   "B4" => Cell.new("B4"),
                   "C1" => Cell.new("C1"),
                   "C2" => Cell.new("C2"),
                   "C3" => Cell.new("C3"),
                   "C4" => Cell.new("C4"),
                   "D1" => Cell.new("D1"),
                   "D2" => Cell.new("D2"),
                   "D3" => Cell.new("D3"),
                   "D4" => Cell.new("D4"),
                  }
  end

  # make sure our cells hash has the coordinate in it
  def valid_coordinate?(coordinate)
    @cells.include? coordinate
  end

  def consecutive?
    row_values = [] # empty array for letters
    column_values = [] #  empty array for numbers
    array = @array_coordinates.map do |coordinate| # iterate through array_coordinates
      single_cord = coordinate.split("") # splits every coordinate into arrays of two elements
      row_values.push single_cord[0] # add letters to row coordinate array
      column_values.push single_cord[1].to_i # add numbers to column array
      coordinate.ord + coordinate[1].to_i # this is what gets mapped to the array - the ordinal values
    end
    array.sort.each_cons(2).all? { |x, y| x == y - 1 } # makes array pairs from our array and checks that they are consecutive
    # using the ord values and checking for x == y - 1 prevents diagnol placement (see ordinal value diagram)
  end

  def overlapping?(ship, coordinates)
    # iterate throught coordinates parameter in valid_placement?
    coordinates.each do |coordinate|
      # iterate throught the boards cell values
      @cells.values.each do |cell|
        # check to see if the cells.values cell.ships are equal to nil
        if cell.ship != nil
          # if so then overlapping is true
          return true
        else
          # or if not return a false
          return false
        end
      end
    end
  end

  def valid_placement?(ship, coordinates)
    @array_coordinates = coordinates
    if ship.length != coordinates.length
      false
    elsif ship.length == coordinates.length
      consecutive?
    elsif ship.length == coordinates.length
      # if overlapping? is true then dont place and if false then we can place ship
      if overlapping == true
        false
      else
        true
      end
    end
  end

  def place(ship_to_be_placed, placement_coordinates)
    # iterate throught the placement_coordinates
    placement_coordinates.each do |placement_coordinate|
      # iterate throught the boards cell values
      @cells.values.each do |cell|
        # for all the cells.values cell.coordinates that are equal to a placement_coordinate
        if placement_coordinate == cell.coordinate
          # update that values cell.ship so it is now equal to the ship_to_be_placed
          cell.ship = ship_to_be_placed
        end
      end
    end
  end

  def render(default = false)
    # render can be refctored later to be dynamic
    puts "\n  1 2 3 4\nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}\nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}\nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}\nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}"
  end

end
