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
cpu.cpu_place_ships
human.human_place_ships
game.play_the_game
# game.end_the_game
