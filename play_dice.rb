require "./dice"
require "./game"

puts "Dice. Me the computer vs You! huMAN! What is your name huMAN!"

player1 = Player.new gets.chomp, Dice.new
player2 = Player.new "computer", Dice.new
game = Game.new player1, player2
game.play!
game.winner



