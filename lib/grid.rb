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

    def to_s
      result = ''
      @height.times do |y|
        @width.times do |x|
          result << (cell(x, y) ? 'X' : ' ')
        end
        result << "\n"
      end
      result
    end

    private def cell_count(x, y)
    return 0 if out_of_bounds?(x, y)
    cell(x, y) ? 1 : 0
  end

  private def out_of_bounds?(x, y)
  x < 0 || x >= @width || y < 0 || y >= @height
end
end
