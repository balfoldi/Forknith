require 'pry'
require 'open-uri'
require 'bundler'
Bundler.require

require_relative 'lib/game.rb' #connecting app_3.rb with lib/game.rb
require_relative 'lib/player.rb' #connecting app_3.rb with lib/player.rb

#displaying welcome messgae
system("echo \"\e[33m  -----------------------------------------------\e[0m\"")
system("echo \"\e[33m |   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |\e[0m\"")
system("echo \"\e[33m |Le but du jeu est d'être le dernier survivant !|\e[0m\"")
system("echo \"\e[33m -------------------------------------------------\e[0m\"")

puts "Choisis un nom: "

user_name = gets.chomp #makes user chose username

my_game = Game.new(user_name) #create a Game object called my_game

while my_game.is_it_still_ongoing? #creating a loop lasting until conditions to make the game end matched
  sleep(1) #pacing
  my_game.show_players #showing user life points and number of players
  sleep(1) #pacing
  my_game.menu #displaying menu
  sleep(1) #pacing
  my_game.menu_choice #executing user's choice
  sleep(1) #pacing
  my_game.enemies_attacks #executing enemies counter attack
  sleep(1) #pacing
end #closing the loop

  my_game.end #ending the game with displaying final message
