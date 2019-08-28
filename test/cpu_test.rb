require './lib/board'
require './lib/cell/'
require './lib/ship/'
require './lib/cpu/'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CpuTest < Minitest::Test
  def setup
    @cpu = Cpu.new(@cpu_board)
    @cpu_board = Board.new
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
  end

  def test_existence
    assert_instance_of Cpu, @cpu
  end

  def test_cpu_interactions
    # assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @cpu_board.render
    @cpu.cpu_place_ships
  end
end
