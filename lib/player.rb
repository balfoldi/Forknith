class Player #creating Player class
  attr_accessor :name, :life_points, :damages #declaring instance variables with attr_accessor

  def initialize(name) #defining initialize method with the player's name as an argument

    @name = name #giving a value to name thanks to 'Player.new(name)'
    @life_points = 10 #defining 10 as the default number of player's life points
  end #closing the method

  def show_state #defining show_state method
    puts "#{@name} a #{@life_points} points de vie." #displaying a player's number of life points
  end #closing the method

  def gets_damage(damages) #defining get_damage method with the number of damages as an argument
    @life_points = @life_points - damages #calculating the number of a player's life point after he got damages
    if @life_points <= 0 #defining as a condition to have 0 life points left
      puts "le joueur #{@name} a été yeeté." #if we want to display a 'you are dead' message
    end #closing the condition
  end #closing the method

  def compute_damage #defining compute_damage method
    return rand(1..6) #returning an integer that will be used as the number of damages provided when a player attacks
  end #closing the method

  def attacks(victim) #defining the attacks method with the player who suffers the attack as an argument
    puts "Le joueur #{@name} attaque le joueur #{victim.name}." #displaying the attack
    @damages = compute_damage #computing an integer as the number of damages
    puts "Il/Elle lui inflige #{@damages} points de dommages." #displaying the number of damages provided
    victim.gets_damage(@damages) #withdrawing life points to the player suffering the attack according to the computed amount of damages provided
  end #closing the method

end #closing the class


class HumanPlayer < Player #creating HumanPlayer subclass
  attr_accessor :weapon_level, :new_weapon_level #declaring instance variables

    def initialize(name) #defining initialize method with name as an argument
      super(name) #calling the initialize method from the parent class Player in order to compute the argument name
      @life_points = 100 #giving a custom number of life points to instances of HumanPlayer
      @weapon_level = 1 #giving the weapon_level instance variable a value
    end #closing the method

    def show_state #defining custom show_state method
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}." #displaying number of life points AND level of the weapon of the player
    end #closing the method

    def compute_damage #defining custom compute_damage method
      rand(1..6) * @weapon_level #returning a random integer between 1 and 6 factored by the player's weapon level
    end #closing the method

    def search_weapon #defining search_weapon method
      @new_weapon_level = rand(1..6) #attributing to the custom @new_weapon_level of the subclass a random integer between 1 and 6
      puts "Tu as trouvé une arme de niveau #{@new_weapon_level}." #displaying the level of weapon found
      if @new_weapon_level > @weapon_level #defining as a condition that the new weapon musts have a bigger level than the older one
        @weapon_level = @new_weapon_level #if we want the level of the player's weapon to change
        puts "Tu yeetes l'ancienne arme." #and display the new level
      else #defining an else statement
        puts "C'est de la bite en boite, tu gardes l'ancienne arme." #in order to display ortherwise
      end #closing the conditional behavior
    end #closing the method

    def search_health_pack #defining search_helth_pack method
      case dice = rand(1..6) #starting a case statement with computing a random value between 1 and 6
      when 1 #in the case when rand() returns 1
        puts "Pas de bol, tu n'as rien trouvé" #displaying a 'epic fail' message
      when 2..5 #in the case when rand() returns a value comprised between 2 and 5
        @life_points + 50 <= 100 ? @life_points += 50 : @life_points = 100 #adds 50 life points or to the max 100 life points if the player lacks less than 50 life points
        puts "Tu as trouvé un pack de +50 points de vie." #display the health pack's number of life points
      when 6 #in the case when rand() returns 6
        @life_points + 80 <= 100 ? @life_points += 80 : @life_points = 100 #adds 80 life points or to the max 100 life points if the player lacks less than 80 life points
        puts "Tu as trouvé un pack de +80 points de vie." #display the health pack's number of life points
      end #closing the case statement
    end #closing the method

end #closing the subclass
