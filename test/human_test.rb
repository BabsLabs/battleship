require './lib/board'
require './lib/cell/'
require './lib/ship/'
require './lib/human/'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class HumanTest < Minitest::Test
  def setup
    @human = Human.new
    @human_board = Board.new
  end

  def test_existence
    assert_instance_of Human, @human
  end

  def test_human_interaction
    
  end
end
