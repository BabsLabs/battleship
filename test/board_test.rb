require 'minitest/autorun'
require 'minitest/pride'
<<<<<<< HEAD
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test

=======
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class CellTest < Minitest::Test
>>>>>>> 35cb8c6f559f53aa3ca99e587760735abf3eea57
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

<<<<<<< HEAD
  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells
    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length
    # verify that the values are cell objects
=======
  def test_existence
    assert_instance_of Board, @board
  end

  def test_board_cells
    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length
>>>>>>> 35cb8c6f559f53aa3ca99e587760735abf3eea57
  end

  def test_valid_coordinate?
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

<<<<<<< HEAD
  # maybe split into three tests and three methods
  def test_valid_placement?
    # check to see if coordinate array is the length of the ship
    # assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    # assert_equal false,  @board.valid_placement?(@submarine, ["A2", "A3", "A4"])

    # make sure the coordinates are consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    # assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    # assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    # assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

=======
  def test_method_consecutive?
    assert_equal false, @board.consecutive?(@cruiser, ["A1", "A2", "A4"])
  end

  # def test_valid_placement?
    #length
    # assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    # assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    #consecutive
    # assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  # end

  # def test_consecutive?
  #   @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  #   @board.valid_placement?(@submarine, ["A1", "C1"])
  #   @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
  #   @board.valid_placement?(@submarine, ["C1", "B1"])
  # end
>>>>>>> 35cb8c6f559f53aa3ca99e587760735abf3eea57
end
