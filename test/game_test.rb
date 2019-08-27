require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'
class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_welcome_prints
    assert_equal "Welcome to BATTLESHIP!", @game.welcome
  end

  def test_play_prompt
    assert_equal "Enter p to play. Enter q to quit.", @game.play_prompt
  end

end
