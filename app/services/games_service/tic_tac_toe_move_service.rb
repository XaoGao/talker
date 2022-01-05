module GamesService
  class TicTacToeMoveService < Service
    include Callable

    def call(current_turn:, current_cell:, cells:)
      next_turn = current_turn == 'X' ? 'O' : 'X'

      new_cells = cells
      new_cells[current_cell] = current_turn

      TicTacToeMove.new(next_turn, new_cells, winner(new_cells))
    end

    private

    def winner(cells)
      winner = nil
      win_combinations.each do |single_win_combo|
        win_index_1 = single_win_combo[0]
        win_index_2 = single_win_combo[1]
        win_index_3 = single_win_combo[2]

        position_1 = cells[win_index_1]
        position_2 = cells[win_index_2]
        position_3 = cells[win_index_3]

        if position_1 != '' && position_2 != '' && position_3 != ''
          if position_1 == position_2 && position_2 == position_3
            winner = position_1
          end
        end
      end
      winner
    end

    def win_combinations
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]
    end
  end
end
