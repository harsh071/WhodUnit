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
  attr_reader :weapons, :numberPlayers, :index, :locations, :suspects, :cards
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
    @numberPlayers = numplayers
    @index = index
    @suspects = suspects.clone
    @locations = locations.clone
    @weapons = weapons.clone
    @cards = [] #these are the cards that the player will hold later on as they are distributed.
  end


end