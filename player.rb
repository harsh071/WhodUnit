=begin
// CLASS: ComputerPlayer.
// Author: HARSH PATEL , 7846258
//
// REMARKS: This is the Computer Player class
// which plays with the human
//
//-----------------------------------------
=end
require_relative "AbstractPlayer"
class Player < AbstractPlayer
  def initialize
    puts "Computer Player initialized. "
  end

  def setup(numplayers, index, suspects, locations, weapons)
    super(numplayers, index, suspects, locations, weapons)
  end

    def canAnswer(player_i,guess)

    puts "Asking player "+ @index.to_s

    index1 = nil
    @cards.each_index { |card_idx|
      if(@cards[card_idx].value == guess.weapon.value)
        index1 = card_idx
      end
      }
    index2 = nil
    @cards.each_index { |card_idx|
      if(@cards[card_idx].value == guess.place.value)
        index2 = card_idx
      end
    }
    index3  = nil
    @cards.each_index { |card_idx|
      if(@cards[card_idx].value == guess.person.value)
        index3 = card_idx
      end
    }

    if(index1!=nil)
      if(player_i.class == InteractivePlayer)
        puts "Player " +@index.to_s + " refuted your suggestion by showing you " + cards[index1].value
      else
        puts "Player " + @index.to_s + " Answered"
      end
      return @cards[index1]

    elsif(index2!=nil)
      if(player_i.class == InteractivePlayer)
        puts "Player " +@index.to_s + " refuted your suggestion by showing you " + cards[index2].value
      else
        puts "Player " + @index.to_s + " Answered"
      end
      return @cards[index2]

    elsif(index3!=nil)
      if(player_i.class == InteractivePlayer)
        puts "Player " +@index.to_s + " refuted your suggestion by showing you " + cards[index3].value
      else
        puts "Player " + @index.to_s + " Answered"
      end
      return @cards[index3]

    else
      return nil

    end

  end

  def setCard(card)
    @cards.push(card)
  end

  end