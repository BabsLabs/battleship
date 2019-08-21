require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_cell_does_not_have_a_ship
    assert_equal nil, @cell_1.ship
  end

  def test_empty?
    assert_equal true, @cell_1.empty?
  end

  def test_place_ship
    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
    assert_equal false, @cell_1.empty?
  end

  def test_cell_starts_not_fired_upon
    assert_equal false,  @cell_1.fired_upon?
  end

  def test_cells_can_be_fired_upon
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
    assert_equal true, @cell_1.fired_upon?
    @cell_1.fire_upon
    assert_equal 1, @cell_1.ship.health
    @cell_1.fire_upon
    assert_equal 0, @cell_1.ship.health
    assert_equal true, @cell_1.ship.sunk?
  end

  def test_render
    assert_equal ".", @cell_1.render
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon
    assert_equal "H", @cell_1.render
    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
  end

end
