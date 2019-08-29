class Human
  attr_reader :human_board

  def initialize(human_board)
    @human_board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end

end
