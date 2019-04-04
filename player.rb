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

  def initialize #contructor.
    puts "Computer Player initialized. "
  end

  def setup(numplayers, index, suspects, locations, weapons) #this gives the player the info of the game
    super(numplayers, index, suspects, locations, weapons)
  end

    def canAnswer(player_i,guess) #checks if the player has the cards and can answer.

    puts "Asking player "+ @index.to_s

    #checks which cards out of the 3 the player has.

    if(@cards!=nil)
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
    end




    #if the first card is available.
    if(index1!=nil)
      if(player_i == @numPlayers)
        player_i.receiveInfo(@index,@cards[index1])
      else
        puts "Player " + @index.to_s + " Answered"
      end
      return @cards[index1]

      #if the Second card is available.
    elsif(index2!=nil)
      if(player_i.class == @numPlayers)
        player_i.receiveInfo(@index,@cards[index2])

      else
        puts "Player " + @index.to_s + " Answered"
      end
      return @cards[index2]

      #if the Third card is available.
    elsif(index3!=nil)
      if(player_i.class == @numPlayers)
        player_i.receiveInfo(@index,@cards[index3])

      else
        puts "Player " + @index.to_s + " Answered"
      end
      return @cards[index3]

    else #if the player has none of the cards in the guess.
      return nil

    end

  end

  def setCard(card) #adds to the cards the player has distributed.

    @cards.push(card)

    if(card.type == :place)  #checks which cards have been added.
      @locationsGuess.each_index do
      |location_idx|
        if(@locationsGuess[location_idx].value == card.value)
          @locationsGuess.delete_at(location_idx)
        end
      end
    elsif (card.type == :person)
      @suspectsGuess.each_index do
      |suspect_idx|
        if(@suspectsGuess[suspect_idx].value == card.value)
          @suspectsGuess.delete_at(suspect_idx)
        end
      end
    elsif (card.type == :weapon)
      @weaponsGuess.each_index do
      |weapon_idx|
        if(@weaponsGuess[weapon_idx].value == card.value)
          @weaponsGuess.delete_at(weapon_idx)
        end
      end
    end # if
  end #setup card.


#get guess gives reasonable guesses by the computer.

  def getGuess
    value = false

    #checks for the weapon to guess for randomly
    weaponIdx = 0
    weaponSample = @weaponsGuess.sample
    @weapons.each_index do
    |weapon_idx|
      if(weaponSample.value == @weapons[weapon_idx].value)
        weaponIdx = weapon_idx
      end
    end

    #checks for the location to guess for randomly

    locationIdx = 0
    locationSample = @locationsGuess.sample
    @locations.each_index do
    |location_idx|
      if(locationSample.value == @locations[location_idx].value)
        locationIdx = location_idx
      end
    end


    #checks for the suspect to guess for randomly
    suspectIdx = 0
    suspectSample = @suspectsGuess.sample
    @suspects.each_index do
    |suspect_idx|
      if(suspectSample.value == @suspects[suspect_idx].value)
        suspectIdx = suspect_idx
      end
    end


    if(@weaponsGuess.size == 1 && @locationsGuess.size == 1 && @suspectsGuess.size == 1)
      value = true
    end



    return Guess.new(@suspects[suspectIdx],@locations[locationIdx],@weapons[weaponIdx],value)

  end


  def receiveInfo(player_i , c)

    if(player_i != -1 && !c.nil?)  #checks if the information received is not nil.

      # checks for which card is received and removes it from the array so it cannot be guessed again.
    if(c.type == :place)
      @locationsGuess.each_index do
        |location_idx|
        if(@locationsGuess[location_idx].value == c.value)
          @locationsGuess.delete_at(location_idx)
        end
      end
    elsif (c.type == :person)
      @suspectsGuess.each_index do
      |suspect_idx|
        if(@suspectsGuess[suspect_idx].value == c.value)
          @suspectsGuess.delete_at(suspect_idx)

        end
      end
    elsif (c.type == :weapon)
      @weaponsGuess.each_index do
      |weapon_idx|
        if(@weaponsGuess[weapon_idx].value == c.value)
          @weaponsGuess.delete_at(weapon_idx)

        end
      end
    end #checking which type of card

    end #if player index is not -1

  end #receive info



  end