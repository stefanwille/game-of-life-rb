require 'rspec'
require 'grid'

describe Grid do
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
