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
    if user_input == "a" #defining as a condition that user_input equals ''
      @human_player.search_weapon #executing search_weapon method on @human_player
    elsif user_input == "s"
      @human_player.search_health_pack
      #sleep(2)
    elsif user_input.to_i < @@enemies.length
      target = @@enemies[user_input.to_i]
      @human_player.attacks(target)
      kill_player(target) if target.life_points <= 0
    else
      puts "FATAL ERROR! Tape un caractère proposé dans le menu."
      menu_choice
    end
  end

  def enemies_attacks
    @@enemies.each { |enemy| enemy.attacks(@human_player) }
  end

  def end
    @human_player.life_points > 0 ? (puts "Y E E T ! tu as gagné gg wp!") : (puts "S H A M E")
  end
end
