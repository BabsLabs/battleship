require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells
    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length
    # verify that the values are cell objects
  end

  def test_valid_coordinate?
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

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

end
