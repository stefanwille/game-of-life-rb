require 'grid'

class Game
  def initialize(width, height)
    @width = width
    @height = height
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

  def animate(delay=0.3)
    loop do
      system("clear")
      puts to_s
      sleep delay
      step
    end
  end

  def step
    new_grid = Grid.new(@width, @height)
    @height.times do |y|
      @width.times do |x|
        new_grid.set(x, y, live_in_next_step?(x, y))
      end
    end
    @grid = new_grid
  end

  private def live_in_next_step?(x, y)
  live = @grid.cell(x, y)
  neighbours = @grid.neighbours(x, y)
  live?(live, neighbours)
end

def to_s
  @grid.to_s
end
end
