require 'bundler' #requiring the bundler gem
Bundler.require

require_relative 'lib/game' #connecting app.rb to game.rb in lib directory
require_relative 'lib/player' #connecting app.rb to player.rb in lib directory

system("echo \"\e[33m  -----------------------------------------------\e[0m\"") #displaying a welcome screen with dope colours
system("echo \"\e[33m |   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |\e[0m\"")
system("echo \"\e[33m |Le but du jeu est d'être le dernier survivant !|\e[0m\"")
system("echo \"\e[33m -------------------------------------------------\e[0m\"")


user = HumanPlayer.new("Acqui") #creating the HumanPlayer object called Acqui

player1 = Player.new("Grunt") #creating the Players objects Grunt and itsjayheart
player2 = Player.new("itsjayheart")

enemies = [player1, player2] #creating an array of all enemies

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) #creating a loop running as long as Acqui and at least one of their enemies still have life points

  sleep(0.5) #creating pacing by making pauses in the execution of the program
  user.show_state #display Acqui's lifepoints
  sleep(1) #pacing
  puts "" #space :om
  system("echo \"\e[4mQuelle action veux-tu effectuer ?\e[0m\"") #displaying a user's choices menu
  puts ""
  sleep(0.5)
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner "
  sleep(0.5)
  puts ""
  puts "  Attaquer un joueur en vue :"
  print "0 - "
  player1.show_state
  print "1 - "
  player2.show_state
  sleep(0.5)
  puts ""
  puts ">Entrer input:"
  user_input = gets.chomp #asking for user_input

  case user_input #creating a case statement around user_input
  when "a" #in the case when user_input equals 'a'
    user.search_weapon #execute search_weapon method
    sleep(2) #pacing
  when "s" #in the case when user_input equals 's'
    user.search_health_pack #execute search_health_pack_method
    sleep(2) #pacing
  when "0" #in the case when user_input equals '0'
    user.attacks(player1) #make Acqui attacks Grunt
    sleep(0.5) #pacing
  when "1" #in the case when user_input equals '1'
    user.attacks(player2) #make Acqui attacks itsjayheart
    sleep(0.5) #pacing
  end #closing the case statement

  enemies.each do |enemy| #using the each method on the enemies array
    enemy.attacks(user) if enemy.life_points > 0 #in order to make any living enemy attack the user
    sleep(0.5) #pacing
  end #closing the each method
  sleep(1) #pacing
end #closing while loop

user.life_points > 0 ? (puts "Yeet! tu as gagné !") : (puts "Shame.") #displaying a victory or 'game over' message
