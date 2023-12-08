require './tic_tac_toe'

describe Game do
  subject(:game) { described_class.new }

  describe "#valid_move?" do
    context 'it returns true if the move is between 0 and 8' do
      before do 
        game.instance_variable_set(:@pick, [])
      end
      it 'returns true if the move is valid' do
        expect(game.valid_move?('5')).to be true
      end
    end
  end

  describe "#check_winner" do
    context 'it shows players victory' do

      it 'returns X player won' do
        game.instance_variable_set(:@board, ['X','X','X', 3, 4, 5, 6, 7, 8])
        expect(game.check_winner).to be true
      end

      it 'returns O player won' do
        game.instance_variable_set(:@board, [0, 1, 2, 3, 4, 5,'O','O','O'])
        expect(game.check_winner).to be true
      end
    end

    context 'it shows draw' do
      it 'return a TIE' do
        game.instance_variable_set(:@board, ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'])
        expect(game.check_winner).not_to be true
      end
    end
  end

  describe "#game_over" do
    context 'it doesnt end the game if conditions arent met' do
      it 'returns false when game reaches 7 turns without a winner' do
        allow(game).to receive(:check_winner).and_return(false)
        allow(game).to receive(:turns).and_return(7)
        expect(game.game_over).not_to be true
      end
    end
  end
end