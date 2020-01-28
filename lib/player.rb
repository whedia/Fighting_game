class Player
  attr_accessor :name, :life_point

  def initialize(name)
    @name = name
    @life_point = 10
  end

  def show_state()
    puts "#{name} a #{life_point} points de vie"
  end

  def gets_damage(damage)
    @life_point = life_point - damage
    if @life_point > 0
      puts "#{name} a #{life_point} de vie"
    else
      puts "\nle joueur #{name} est MOORT !"
    end
  end

  def compute_damage
    return rand(1..6)
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}"
    dmg = compute_damage
    puts "il lui inflige #{dmg} points de dommages"
    player.gets_damage(dmg)
  end
  
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize(name)
  super(name)
  @life_point = 100
  @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{life_point} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level <= @weapon_level
      @weapon_level = @weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle...Tu gardes l'ancienne."
    else
      @weapon_level = new_weapon_level
      puts "Youhou ! Elle est meilleur que ton arme actuelle : tu la prends."
    end
  end

  def search_health_pack
    result = rand(1..6)
    if result == 1
      puts "Tu n'as rien trouvé..."
    elsif result <= 5
      @life_point += 50
      if @life_point > 100
        @life_point = 100
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie ! Tu as maintenant #{life_point} points de vie !"
    else
      @life_point += 80
      if @life_point > 100
        @life_point = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie ! Tu as maintenant #{life_point} points de vie !"
    end
  end

end

