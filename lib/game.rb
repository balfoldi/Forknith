class Game #creating Game class
  attr_accessor :human_player, :enemies #declaring instance variables with attr_accessor

  @@enemies = [] #creating an enemies array as a class variable

  def initialize(user_name) #defining initialize method with (user_name) as an argument
    @human_player = HumanPlayer.new(user_name) #creating a HumanPlayer object called user_name and attributing it to the instance variable @human_player
    4.times do |i| # creating a loop running four times
      @@enemies << Player.new("Player#{i}") #inserting four Player objects in the @@enemies array
    end #closing the four times loop
  end #closing the method

  def kill_player(player) #defining kill_player method with a Player object as an argument
    @@enemies = @@enemies - [player] #withdrawing the Player object from the enemies array
  end #closing the method

  def is_it_still_ongoing? #defining is_it_still_ongoing? method
    @human_player.life_points > 0 && @@enemies.length > 0 #returns true if @human_player still has lifepoints and there are still Player objects in the enemies array
  end #closing the method

  def show_players #defining show_players method
    @human_player.show_state #displaying @human_player's life points
    @@enemies.each { |enemy| enemy.show_state } #displaying all ennemies life points
  end #closing the method

  def menu #defining menu method
    puts ""
    system("echo \"\e[4mQuelle action veux-tu effectuer ?\e[0m\"") #displaying menu
    puts ""
    sleep(0.5)
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher à se soigner "
    sleep(0.5)
    puts ""
    puts "  Attaquer un joueur en vue :"
    x = 0
    @@enemies.each do |enemy| #using each method on the @@enemies array in order to display all user's potential targets for an attack
      print "#{x} - "
      x+=1
      enemy.show_state
      puts ''
    end #closing each method
  end #closing the method

  def menu_choice #defining menu_choice method
    user_input = gets.chomp #asking for user input
    if user_input == "a" #defining as a condition that user_input equals 'a'
      @human_player.search_weapon # for executing search_weapon method on @human_player
    elsif user_input == "s" #defining as a condition that user_input equals 's'
      @human_player.search_health_pack #for executing search_health_pack method on @human_player
    elsif user_input.to_i < @@enemies.length #defining as a condition that user_input is inferior to the numeber of enemies
      target = @@enemies[user_input.to_i] #for targeting the enemy with user_input as an index for attack
      @human_player.attacks(target) #and attacking them
      kill_player(target) if target.life_points <= 0 #and killing them -withdrawing them from the @@enemies array-
    else #defining an else behavior
      puts "FATAL ERROR! Tape un caractère proposé dans le menu." #displaying an error message
      menu_choice #relaunching menu_choice method
    end #closing the if.elsif.else
  end #closing the method

  def enemies_attacks #defining enemies_attack method
    @@enemies.each { |enemy| enemy.attacks(@human_player) } #making all enemies alive attack @human_player
  end #closing the method

  def end #defining end method
    @human_player.life_points > 0 ? (puts "Y E E T ! tu as gagné gg wp!") : (puts "S H A M E") #displaying victory or 'game over' message
  end #closing the method
end #closing class
