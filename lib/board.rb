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


  def valid_placement?(ship, coordinates)
    @array_coordinates = coordinates
    if ship.length != coordinates.length
      false
    elsif ship.length == coordinates.length
      consecutive?
    end
  end

  def place(ship_to_be_placed, placement_coordinates)
    # iterate throught the placement_coordinates
    placement_coordinates.each do |placement_coordinate|
      # iterate throught the cell values
      @cells.values.each do |cell|
        # for all the cells.values cell.coordinates that are equal to a placement_coordinate
        if placement_coordinate == cell.coordinate
          # update that values cell.ship so it is now equal to the ship_to_be_placed
          cell.ship = ship_to_be_placed
        end
      end
    end
  end


end
