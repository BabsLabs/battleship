class Human
  attr_reader :human_board

  def initialize(human_board)
    @human_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end

  def human_place_ships
    # prompt
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is two units long and the Submarine is three units long."

    # render starting board
    @human_board.render

    # tell them to place cruiser
    # puts "\nEnter the coordinates for the Cruiser (3 spaces):"

    # iterate through the ships to place
    @ships.each do |ship_to_place|
    puts "\nEnter the coordinates for the #{ship_to_place.name} (#{ship_to_place.length} spaces):"

    # get the human input!
    human_input = []
    until human_input.length == ship_to_place.length && @human_board.valid_placement?(ship_to_place, human_input)
      human_input << gets.chomp.downcase.to_s
    end



    # human_input = []
    # until human_input.length == ship_to_place.length
    #   human_input << gets.chomp.downcase.to_s
    # end
    # until @human_board.valid_placement?(ship_to_place, human_input)
    #   human_input << gets.chomp.downcase.to_s
    #   # @human_board.place(ship_to_place, human_input)
    # end
    #
    #
    # # until @human_board.valid_placement?(ship_to_place, human_input) == true
    # #   # until human_input.length == ship_to_place.length
    # #   human_input << gets.chomp.downcase.to_s
    # #   # if human_input.length != ship_to_place.length
    # #   #   puts "Coordinates not valid. Enter valid coordinates."
    # #   # elsif human_input.length == ship_to_place.length
    # #   # end
    # #   # end
    # # end
    # #   @human_board.place(ship_to_place, human_input)
    end
  end


end
