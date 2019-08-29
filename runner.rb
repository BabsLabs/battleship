require './lib/board'
require './lib/cell/'
require './lib/ship/'
require './lib/human/'
require './lib/cpu/'
require './lib/game/'

loop do
  game = Game.new
  game.start_game
  game.cpu_place_ships
  game.human_place_ships
  game.render_the_boards
  # game.end_the_game
end
