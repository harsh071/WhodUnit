require_relative "Player"
require_relative "Card"
require_relative "Guess"
require_relative "Model"
require_relative "InteractivePlayer.rb"
#
# puts("Welcome to \"whodunnit?\"")
people = [
  Card.new(:person,"Prof. Boyer"),
  Card.new(:person,"Prof. Domaratzki"),
  Card.new(:person,"Prof. Cameron"),
  Card.new(:person,"Prof. Guderian"),
  Card.new(:person,"Prof. Durocher"),
  Card.new(:person,"Prof. Li"),
  Card.new(:person,"Prof. Miller"),
  Card.new(:person,"Prof. Wang"),
  Card.new(:person,"Prof. Bristow")

  ]

places = [
  Card.new(:place,"COMP 2150 course"),
  Card.new(:place,"COMP 2160 course"),
  Card.new(:place,"COMP 2140 course"),
  Card.new(:place,"COMP 2280 course"),
  Card.new(:place,"COMP 2080 course")
  ]

weapons = [
  Card.new(:weapon,"midterm"),
  Card.new(:weapon,"final exam"),
  Card.new(:weapon,"assignment"),
  Card.new(:weapon,"lab"),
  ]
#
# o = Model.new(people,places,weapons)
# puts("How many computer opponents would you like?")
# numPlayers = gets.chomp.to_i
#
# players = Array.new(numPlayers+1)
# (numPlayers).times { |i| players[i] = Player.new() }
# players[numPlayers] = InteractivePlayer.new()
#
# puts("Setting up players..")
# o.setPlayers(players)
# puts("Dealing cards..")
# o.setupCards()
# puts("Playing...")
# o.play()
# puts ("Game over")
harsh = InteractivePlayer.new()
harsh2 = Player.new()
harsh.setup(2, 1,people,places,weapons)
harsh2.setup(2, 2,people,places,weapons)



# harsh.locations.each do |weapon|
#   weapon.printit
# end
what = Guess.new(true,harsh.suspects[0],harsh.locations[0],harsh.weapons[0])
harsh.setCard(  Card.new(:place,"COMP 2150 course"))
harsh.setCard(  Card.new(:weapon,"midterm"))
harsh.setCard(  Card.new(:weapon,"Prof. Boyer"))
harsh2.setCard(  Card.new(:place,"COMP 2160 course"))
harsh2.setCard(  Card.new(:weapon,"final exam"))
harsh2.setCard(  Card.new(:weapon,"Prof. Miller"))


carsss = harsh.canAnswer(harsh2,what)
if(carsss == nil)
puts "sorry "
end
  #
# harsh.cards.each do |weapon|
#   weapon.printit
# end


# what.printit

# print harsh.suspects
# puts harsh.locations
# puts harsh.index.to_s
# puts harsh.numberPlayers
