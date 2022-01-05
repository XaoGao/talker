require 'rails_helper'

describe GamesService::TicTacToeMoveService do
  subject(:tic_tac_toe_move_service) { described_class.new }

  describe '.winner' do
    let(:x_row_winner_cells) { ['X', 'X', 'X', 'O', 'O', '', '', '', ''] }
    let(:x_col_winner_cells) { ['X', 'O', 'O', 'X', '', '', 'X', '', ''] }
    let(:o_dig_winner_cells) { ['O', 'X', 'X', '', 'O', 'X', '', '', 'O'] }
    let(:draw_cells) { ['', '', '', '', '', '', '', '', ''] }

    it 'x winner by row' do
      expect(tic_tac_toe_move_service.send(:winner, x_row_winner_cells)).to eq('X')
    end

    it 'x winner by col' do
      expect(tic_tac_toe_move_service.send(:winner, x_col_winner_cells)).to eq('X')
    end

    it 'o winner by diagonal' do
      expect(tic_tac_toe_move_service.send(:winner, o_dig_winner_cells)).to eq('O')
    end

    it 'no body win' do
      expect(tic_tac_toe_move_service.send(:winner, draw_cells)).to be nil
    end
  end

  describe '.call' do
    let(:x_row_winner_cells) { ['', 'X', 'X', '', '', '', '', 'O', 'O'] }

    it 'x is winner' do
      result = described_class.call(current_turn: 'X', current_cell: 0, cells: x_row_winner_cells)
      expect(result).to have_attributes(winner: 'X')
      expect(result).to have_attributes(turn: 'O')
      expect(result).to have_attributes(cells: ['X', 'X', 'X', '', '', '', '', 'O', 'O'])
    end
  end
end
