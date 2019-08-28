require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/cpu'
require 'pry'

class Game
  attr_reader :cpu

  def initialize
    @cpu = Cpu.new(@board = Board.new)
  end

  def start_game
    # starting prompts
    puts "**** Welcome to BATTLESHIP! ****"
    puts "Enter p to play. Enter q to quit."

      # logic for user input to start or quit game
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

  def create_a_ship
    @cpu.cpu_place_ships
  end

end
