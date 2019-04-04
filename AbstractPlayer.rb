=begin
// CLASS: AbstractPlayer
// Author: HARSH PATEL , 7846258
//
// REMARKS: This is the abstract Player class
//
//-----------------------------------------
=end

class AbstractPlayer
  #getters and setters.
  attr_reader :weapons, :numberPlayers, :index, :locations, :suspects, :cards , :finalGuess
  attr_writer :numberPlayers



  def AbstractPlayer.new(*args) #constructor.
    if self == AbstractPlayer
        raise "Cannot make an instance of an abstract player "
    else
      super
    end
  end


  #Recieves info about the games so that the player is ready to play .
  def setup(numplayers, index, suspects, locations, weapons)
    @suspects = suspects
    @locations = locations
    @weapons =weapons
    @suspectsGuess = []
    @locationsGuess = []
    @weaponsGuess = []
    @numberPlayers = numplayers
    @index = index


    suspects.each { |s| @suspectsGuess.push(s.clone) }
    locations.each { |l| @locationsGuess.push(l.clone) }
    weapons.each { |w| @weaponsGuess.push(w.clone) }

    @cards = [] #these are the cards that the player will hold later on as they are distributed.
    @finalGuess = Array.new(3) # this will be the final correct answer.
  end


end