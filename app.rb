require "pry"

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "\nBIENVENUE DANS LE JEU DE COMBAT :\n\n"

while player1.life_point > 0 && player2.life_point > 0 
  
puts "-------------------------"
puts "\nVoici l'état de chaque joueur :\n\n"
puts "#{player1.show_state}"

puts "#{player2.show_state}"

puts "--------------------------"
puts "Passons à la phase d'attaque :"
puts "--------------------------"

player1.attacks(player2)

if player2.life_point <= 0
  puts "\n\n-- Fin du Game --"
  puts "  ============="
  break
else
player2.attacks(player1)
end 

end

#binding pry
#puts "End of file"