require 'pry'
require 'open-uri'
require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

system("echo \"\e[33m  -----------------------------------------------\e[0m\"")#rajouter des couleurs
system("echo \"\e[33m |   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |\e[0m\"")
system("echo \"\e[33m |Le but du jeu est d'être le dernier survivant !|\e[0m\"")
system("echo \"\e[33m -------------------------------------------------\e[0m\"")

puts "Choisis un nom: "

user_name = gets.chomp

my_game = Game.new(user_name)

while my_game.is_it_still_ongoing?
  #sleep(1)
  my_game.show_players
  #sleep(1)
  my_game.menu
  #sleep(1)
  my_game.menu_choice
  #sleep(1)
  my_game.enemies_attacks
  #sleep(1)
end

  my_game.end
