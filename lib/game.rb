require './lib/board'
require './lib/cell'
require './lib/ship'

class Game

  def initialize
    @cpu_board = Board.new
    @human_board = Board.new
    @cpu_ships = @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
    @human_ships = @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end

  def start_game
    # starting prompt
    puts "**** Welcome to BATTLESHIP! ****"
    puts "Enter p to play. Enter q to quit."
    # get user input to play or quit
      user_input = ""
      # check for valid input and continue based of that
      until user_input == "p" || user_input == "q"
        user_input = gets.chomp.downcase
        if user_input == "p"
          puts "BATTLESHIP started"
        elsif user_input == "q"
          puts "BATTLESHIP aborted"
          exit
        else
          puts "Invalid response. Enter valid response"
        end
      end
  end

  def cpu_place_ships
    # iterate through the cpu_ships array one ship at a time
    @cpu_ships.each do |ship_to_place|
      random_cells = []
      # make a copy of the board keys
      cpu_cells = @cpu_board.cells.keys

      # get random samples of keys until we get consecutive keys equal to the ship length
      until @cpu_board.valid_placement?(ship_to_place, random_cells)
        random_cells = cpu_cells.sample(ship_to_place.length)
      end
      # place the cpu ships in the continue cells
      @cpu_board.place(ship_to_place, random_cells)
    end
  end

  def human_place_ships
    # prompt
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."

    # render starting board
    @human_board.render

    # iterate through the ships to place
    @human_ships.each do |ship_to_place|
    # prompt user to place ships
    puts "\nEnter a coordinate for the #{ship_to_place.name} (One at a time #{ship_to_place.length} times):"

    # a loop to get and check the valid user coordinates
    while true
    human_input = []

    # get the human input the ship length number of times
    ship_to_place.length.times do
      human_input << gets.chomp.upcase.to_s
    end

    # check valid placement of the human ship
    if @human_board.valid_placement?(ship_to_place, human_input)
      # place ships
      @human_board.place(ship_to_place, human_input)
      # render the board
      @human_board.render(true)
      # exit the loop
      break if @human_board.valid_placement?(ship_to_place, human_input)
    else
      # prints error is bad coordinates are provided
      puts "That is an invalid or inconsecutive coordinate! Try again! Example: A1, A2, A3"
    end
    end
  end
  end

  # render both cpu and player boards
  def render_the_boards
    puts "\n=============COMPUTER BOARD============="
    @cpu_board.render
    puts "\n=============PLAYER BOARD============="
    @human_board.render(true)
  end

  # the player takes a shot then the cpu takes a shot
  def turn_shots
    # prompt and get shot
    puts "Enter the coordinate for your shot:"
    shot_coordinate = gets.chomp.to_s.upcase
    # check for valid coordinate
    if @cpu_board.cells.keys.include?(shot_coordinate)
      # fire on that cell
      @cpu_board.cells[shot_coordinate].fire_upon
    # else reprompt
    else
      # if invalid shot coordinate is provided then reprompt
      while true
      puts "Invalid Coordinate. Choices are A1 - D4"
      shot_coordinate = gets.chomp.to_s.upcase
      break if @cpu_board.cells.keys.include?(shot_coordinate)
      end
    end
  end

end
