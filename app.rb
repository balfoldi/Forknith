require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Grunt")
player2 = Player.new("itsjayheart")
player3 = Player.new("Acqui")

while player1.life_points > 0 || player2.life_points > 0
  puts ""
  puts "voici l'état de chaque joueur :"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
  puts ""
  puts "Passons à la phase d'attaque."
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
  gets.chomp
end
