class Player
  attr_reader :board

  def initialize(board)
    @board = Board.new
    @ships = [Ship.new("cruiser", 3), Ship.new("submarine", 2)]
  end



end
