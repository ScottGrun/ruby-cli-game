require('./Game')
require('./Player')

player1 = Player.new('Scott', 1)
player2 = Player.new('Chris', 2)

game = Game.new(player1, player2)

while game.game_over == false  do
   game.ask_question
end


