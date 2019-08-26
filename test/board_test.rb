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
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
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

  # valid placement tests
  def test_ship_length_equals_coordinate_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
  end

  def test_coordinates_are_consecutive?
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_ships_cant_be_diagnol
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B2"])
    assert_equal false, @board.valid_placement?(@cruiser, ["D1", "C2", "B3"])
    assert_equal true, @board.valid_placement?(@cruiser, ["D1", "D2", "D3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
  end

  def test_ships_can_be_placed
    # place the ship in A1 A2 and A3
    @board.place(@cruiser, ["A1", "A2", "A3"])
    # make sure the ship is in those cells
    assert_equal @cruiser, @cell_1.ship
    assert_equal @cruiser, @cell_2.ship
    assert_equal @cruiser, @cell_3.ship
    #make sure the same ship is in those cells
    assert_equal true, @cell_1.ship == @cell_2.ship
    assert_equal true, @cell_3.ship == @cell_2.ship
  end

  def test_ships_cant_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

end
