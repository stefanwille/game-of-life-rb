require 'game'

game = Game.new(40, 40)
game.set(23, 20, true)
game.set(23, 21, true)
game.set(23, 22, true)
game.set(22, 22, true)
game.set(21, 21, true)

# game.set(23, 20, true)
# game.set(23, 21, true)
# game.set(23, 22, true)
# game.set(21, 21, true)

game.animate
