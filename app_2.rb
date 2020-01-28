require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "\n-----------------------"
puts "Bienvenu dans le Game !"
puts "-----------------------\n\n"

puts "Saisis ton prénom :"
print ">"
player0 = HumanPlayer.new(gets.chomp)
puts "\nBienvenu, #{player0.name} !"

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while player0.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0)
  puts "========================\n"
  puts "Voici l'état de chaque joueurs :\n\n"
  puts "#{player0.show_state}"
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
  puts "\nQuelle action veux-tu effectuer ?\n\n"
  puts "a - chercher une meilleur arme"
  puts "s - chercher à se soigner\n\n"
  puts "Attaquer un joueur en vue :\n\n"
  print "0 - " 
  print "#{player1.show_state}"
  print "1 - " 
  print "#{player2.show_state}\n\n"

  puts "Ton choix :"
  print ">"
  entry = 0

  entry = gets.chomp.to_s
   
      if entry == "a"
        player0.search_weapon
      elsif  entry == "s"
        player0.search_health_pack
      elsif entry == "0"
        player0.attacks(player1)
      elsif entry == "1"
        player0.attacks(player2)
      else 
        puts "Tu t'es trompé ! choisi a, s, 0 ou 1 !"
      end
 
  if player2.life_point <= 0 || player1.life_point <= 0
    puts "\n\n-- Fin du Game --"
    puts "  ============="
    break
  end

  enemies.each do |enemie|
    enemie.attacks(player0)
  end

  #player1.attacks(player0)
  #player2.attacks(player0)
  puts "\n\nLes autre joueurs t'attaquent !!\n\n"
end