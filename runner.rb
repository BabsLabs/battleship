require './lib/board'
require './lib/cell/'
require './lib/ship/'
require './lib/human/'
require './lib/cpu/'
require './lib/game/'

game = Game.new
cpu = Cpu.new(Board.new)
human = Human.new(Board.new)
game.start_game
game.cpu_place_ships
game.human_place_ships
game.render_the_boards
# game.end_the_game
