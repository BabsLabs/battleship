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

  # def test_game_can_be_started
  #   @game.start_game
  # end

  def test_game_can_be_played
    @game.start_game
    @game.play_the_game
  end


end
