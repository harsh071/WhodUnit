=begin
// CLASS: Card
// Author: HARSH PATEL , 7846258
//
// REMARKS: This is where the whole game is set up  and played
//
//-----------------------------------------
=end

class Card

  attr_reader :value, :type

  def initialize(type, value)
    @type = type
    @value = value
  end

  def printit
    puts @value
  end


end