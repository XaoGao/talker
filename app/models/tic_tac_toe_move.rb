class TicTacToeMove
  attr_accessor :turn, :cells, :winner

  def initialize(turn, cells, winner)
    @turn = turn
    @cells = cells
    @winner = winner
  end
end
