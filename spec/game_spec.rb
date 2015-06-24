require 'rspec'

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

require 'matrix'

class Matrix
  def []=(row, column, value)
    @rows[row][column] = value
  end
end

class Grid
	def initialize(width, height)
		@width = width
		@height = height
		@cells = Matrix.build(width, height) { false }
	end

	def set(x, y, live)
		@cells[x, y] = live
	end

	def cell(x, y)
		@cells[x, y]
	end

  def neighbours(x, y)
    [
      cell_count(x-1, y-1),
      cell_count(x, y-1),
      cell_count(x+1, y-1),
      cell_count(x-1, y),
      cell_count(x+1, y),
      cell_count(x-1, y+1),
      cell_count(x, y+1),
      cell_count(x+1, y+1)
    ].inject(:+)
  end

  private def cell_count(x, y)
    return 0 if out_of_bounds?(x, y)
    cell(x, y) ? 1 : 0
  end

  private def out_of_bounds?(x, y)
    x < 0 || x >= @width || y < 0 || y >= @height
  end
end
