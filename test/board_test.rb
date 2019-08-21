require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

   def test_cells
     assert_equal 16, @board.cells.keys.length
     assert_equal 16, @board.cells.values.length
   end

  # def test_valid_coordinate?
  #   assert_equal true, @board.valid_coordinate?("A1")
  #   assert_equal true, @board.valid_coordinate?("D4")
  #   assert_equal false, @board.valid_coordinate?("A5")
  #   assert_equal false, @board.valid_coordinate?("E1")
  #   assert_equal false, @board.valid_coordinate?("A22")
  # end

end
