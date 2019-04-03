=begin
// CLASS: Card
// Author: HARSH PATEL , 7846258
//
// REMARKS: This is where the whole game is set up  and played
//
//-----------------------------------------
=end

class Card
  attr_reader :value, :type #getters

  def initialize(type, value) #constructor.
    @type = type
    @value = value
  end

  def printit #prints the cards type and value.
    puts @type.to_s + " : " + @value
  end


end