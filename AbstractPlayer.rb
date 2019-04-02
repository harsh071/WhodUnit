=begin
// CLASS: AbstractPlayer
// Author: HARSH PATEL , 7846258
//
// REMARKS: This is the abstract Player class
//
//-----------------------------------------
=end

class AbstractPlayer
  attr_reader :weapons, :numberPlayers, :index, :locations, :suspects, :cards

  def AbstractPlayer.new(*args)
    if self == AbstractPlayer
        raise "Cannot make an instance of an abstract player "
    else
      super
    end
  end

  def setup(numplayers, index, suspects, locations, weapons)
    @numberPlayers = numplayers
    @index = index
    @suspects = suspects
    @locations = locations
    @weapons = weapons
    @cards = []
  end





end