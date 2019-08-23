require 'pry'
class Board
  attr_reader :cells
  def initialize
    # @cell_bank = Hash.new
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
    #make enumerable verify both key && value == coordinate
    # found_coordinate = nil
    # @cells.each do |key, value|
    #   if value.coordinate == coordinate
    #      found_coordinate = true
    #     # binding.pry
    #     break
    #   elsif value.coordinate != coordinate
    #        found_coordinate = false
    #     break
    #   end
    # end
    # found_coordinate
  end

  # def valid_placement?(ship, coordinates)
    # # if ship.length != coordinates.length
    # #   false
    # # end
    # letters_array = []
    # numbers_array = []
    # coordinates.each do |coordinate|
    #   # coordinate.split("").first && coordinate.split("").last
    #   letters_array.push coordinate.split("").first
    #   numbers_array.push coordinate.split("").last
    #   if
    #   letters_array.all? do |letter|
    #     letter == letters_array[0]
    #
    #   end
    #   numbers_array.each_cons(3) do |number|
    #     number + 1 ==
    #     binding.pry
  #     end
  #     end
  #   end
  #

#==================================

  # end

  def consecutive?(ship, array_coordinates)

    if ship.length == array_coordinates.length
      true
    else
      false
    end
    row_values = []
    column_values = []
    array = array_coordinates.map do |coordinate|
      single_cord = coordinate.split("")
      row_values.push single_cord[0]
      column_values.push single_cord[1].to_i
      # coordinate.ord + coordinate[1].to_i
    end
    row_values.uniq == 1
    column_values.each_cons(2) do |x, y|

  # print x
  # print y
      binding.pry

    end

  #   array.sort.each_cons(2).all? { |x, y| x == y - 1 }
  #   binding.pry
  end
end
