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

