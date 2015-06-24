require 'rspec'
require 'grid'

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

describe 'Grid' do
	describe '#live' do
		it 'returns if the cells at the given coordinates is live' do
			grid = Grid.new(2, 2)
			grid.set(1, 1, true)
			expect(grid.cell(1,1)).to be true
		end
	end

	describe '#neighbours' do
		it 'returns the number of neighbours of the cell at the given coordinates' do
      grid = Grid.new(2, 2)
      grid.set(0, 1, true)
      grid.set(1, 1, true)
      expect(grid.neighbours(0, 0)).to eq(2)
      expect(grid.neighbours(0, 1)).to eq(1)
    end
  end
end

class Game
  def initialize(width, height)
    @grid = Grid.new(width, height)
  end

  def set(x, y, live)
    @grid.set(x, y, live)
  end

  def live?(live, neighbours)
    if live
      neighbours >=2 && neighbours <= 3
    else
      neighbours == 3
    end
  end

  def to_s
    @grid.to_s
  end
end
