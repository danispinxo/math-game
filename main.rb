require "./player"
require "./question"
require "./game"

CurrentGame = Game.new
Player1 = Player.new(1)
Player2 = Player.new(2)

puts CurrentGame.turns
