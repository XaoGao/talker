class GamesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def move
    current_cell = params[:game][:current_cell]
    current_turn = params[:game][:current_turn]
    cells = params[:game][:cells]

    data = GamesService::TicTacToeMoveService.call(current_turn: current_turn, current_cell: current_cell, cells: cells)

    render json: { data: data }, status: :ok
  end

  private

  def game_params
    params.require(:game).permit(:current_cell, :current_turn, :cells)
  end
end
