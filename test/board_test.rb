require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_existence
    assert_instance_of Board, @board
  end

  def test_board_cells
    assert_equal 16, @board.cells.keys.length
    assert_equal 16, @board.cells.values.length
  end

  def test_valid_coordinate?
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_method_consecutive?
    assert_equal false, @board.consecutive?(@cruiser, ["A1", "A2", "A4"])
    assert_equal true, @board.consecutive?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.consecutive?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.consecutive?(@submarine, ["A1", "C1"])
    assert_equal true, @board.consecutive?(@submarine, ["A1", "B2", ])

  end


  def test_valid_placement?
    #length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    #consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  # end

  end
end
