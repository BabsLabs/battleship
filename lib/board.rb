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
    # check if the coordinate is one of the cell keys
    @cells.key?(coordinate)
  end

  def valid_placement?(ship_object, coordinate_array)
    # check to see if coordinate_array is the length of the ship
    if ship_object.length !=  coordinate_array.length
      false
    else

    # check if the coordinate_array is consecutive
    # letters_array = []
    # numbers_array = []

    # iterate through coordinate array and split the coordinate into to arrays. A letter array and a number array.
    # coordinate_array.each do |coordinate|
    #   letters_array << coordinate.split('').first
    #   numbers_array << coordinate.split('').last
    # end

    # check that all the letters in the letters_array are the same
    # if letters_array.all? {|letter| letter == letters_array[0]}
    # end

    # check all the numbers in the numbers_array are consecutive
    # if numbers_array != numbers_array.each_cons(ship_object.length).any? { |x| x  == coordinate_array}
    # end

    # end of first if statement on length
      true
    end
  end

end
