require './lib/board'
require './lib/cell/'
require './lib/ship/'
require './lib/human/'
require './lib/cpu/'
require './lib/game/'

loop do
  game = Game.new
  cpu = Cpu.new
  game.start_game
  cpu.cpu_place_ships
  # # game.create_a_ship
  # game.play_the_game
  # game.end_the_game
end
