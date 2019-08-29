module Playability

  def cpu_place_ships
    @ships.each do |ship_to_place|
      random_cells = []
      cpu_cells = @cpu_board.cells.keys

      until @cpu_board.valid_placement?(ship_to_place, random_cells) == true
        random_cells = cpu_cells.sample(ship_to_place.length)
      end
      @cpu_board.place(ship_to_place, random_cells)
    end
  end

  def human_place_ships
    # prompt
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is two units long and the Submarine is three units long."

    # render starting board
    @human_board.render

    # iterate through the ships to place
    @ships.each do |ship_to_place|
    # prompt user to place ships
    puts "\nEnter a coordinate for the #{ship_to_place.name} (#{ship_to_place.length} spaces):"


    while true
    # get the human input!
    human_input = []

    ship_to_place.length.times do
      human_input << gets.chomp.upcase.to_s
    end

    # check valid placement
    if @human_board.valid_placement?(ship_to_place, human_input)
      # place ships
      @human_board.place(ship_to_place, human_input)
      # render the board
      @human_board.render(true)
      break if @human_board.valid_placement?(ship_to_place, human_input)
    else
      puts "That is an invalid coordinate! Try again! Example: A1"
    end
    end
  end
  end

end
