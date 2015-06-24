require 'rspec'
require 'game'

describe 'Game' do
  describe '#live?' do
    it 'returns if a cell should be live in the next grid' do
      game = Game.new(3,3)
      expect(game.live?(true, 0)).to be false
      expect(game.live?(true, 1)).to be false
      expect(game.live?(true, 2)).to be true
      expect(game.live?(true, 3)).to be true
      expect(game.live?(true, 4)).to be false
      expect(game.live?(true, 5)).to be false

      expect(game.live?(false, 0)).to be false
      expect(game.live?(false, 1)).to be false
      expect(game.live?(false, 2)).to be false
      expect(game.live?(false, 3)).to be true
      expect(game.live?(false, 4)).to be false
      expect(game.live?(false, 5)).to be false
    end

    describe '#step' do
      it 'moves the game to a new generation' do
        game = Game.new(3,3)
        game.set(0, 0, true)
        game.set(1, 0, true)
        game.set(2, 0, true)
        game.step
        expect(game.to_s).to eq(" X \n X \n   \n")
      end
    end
  end

  describe '#to_s' do
    it 'convert the current grid to a string, suitable for printing to the terminal' do
      game = Game.new(3,3)
      game.set(0, 0, true)
      game.set(1, 0, true)
      game.set(2, 0, true)
      expect(game.to_s).to eq("XXX\n   \n   \n")
    end
  end
end

