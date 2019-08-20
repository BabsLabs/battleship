require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_does_not_have_a_ship
    assert_equal nil, @cell.ship
  end

  def test_empty?
    assert_equal true, @cell.empty?
  end

  def test_cruiser_class
    assert_instance_of Ship, @cruiser
  end

  def test_place__ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

end
