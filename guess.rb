=begin
// CLASS: Guess.
// Author: HARSH PATEL , 7846258
//
// REMARKS: a guess is made by a player when they want to learn more information about the game.
//
//-----------------------------------------
=end
class Guess
  attr_reader :weapon, :place, :person, :guess_type #getters.
  def initialize(person, place, weapon,guess_type) #contructors.
    @guess_type = guess_type
    @person = person
    @place  = place
    @weapon = weapon

  end

  def printit #print the guess.
    if(@guess_type)
      print "Suggestion"
    else
      print "Accusation"
    end
    print ": "+ @person.value.to_s + " in " +@place.value.to_s + " with the "+@weapon.value.to_s + "."
  end


  def isAccusation
    return @guess_type
  end
end