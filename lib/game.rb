require './lib/board'
require './lib/cell'
require './lib/ship'

class Game
  def start_game
    puts "**** Welcome to BATTLESHIP! ****"
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
