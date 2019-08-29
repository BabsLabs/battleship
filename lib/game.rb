require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/cpu'
require './lib/playability'

class Game
  include Playability

  def initialize
    @cpu_board = Board.new
    @human_board = Board.new
  end

  def start_game
    puts "**** Welcome to BATTLESHIP! ****"
    puts "Enter p to play. Enter q to quit."
      user_input = ""
      until user_input == "p" || user_input == "q"
        user_input = gets.chomp.downcase
        if user_input == "p"
          puts "BATTLESHIP started"
        elsif user_input == "q"
          puts "BATTLESHIP aborted"
        else
          puts "Invalid response. Enter valid response"
        end
      end
  end

  def render_the_boards
    puts "\n=============COMPUTER BOARD============="
    @cpu_board.render
    puts "\n=============PLAYER BOARD============="
    @human_board.render(true)
  end

end
