class GamesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def move
    current_cell = params[:game][:current_cell]
    current_turn = params[:game][:current_turn]
    cells = params[:game][:cells]

    next_turn = current_turn == 'X' ? 'O' : 'X'

    new_cells = cells
    new_cells[current_cell] = current_turn

    win_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    winner = nil
    win_combinations.each do |single_win_combo|
      win_index_1 = single_win_combo[0]
      win_index_2 = single_win_combo[1]
      win_index_3 = single_win_combo[2]

      position_1 = new_cells[win_index_1]
      position_2 = new_cells[win_index_2]
      position_3 = new_cells[win_index_3]

      if position_1 != '' && position_2 != '' && position_3 != ''
        if position_1 == position_2 && position_2 == position_3
          winner = position_1
        end
      end
    end

    data = TicTacToeMove.new(next_turn, new_cells, winner)
    render json: { data: data }, status: :ok
  end

  private

  def game_params
    params.require(:game).permit(:current_cell, :current_turn, :cells)
  end
end
