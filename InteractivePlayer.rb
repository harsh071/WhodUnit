=begin
// CLASS: Human .
// Author: HARSH PATEL , 7846258
//
// REMARKS: This is the Human Player class
// which interacts with the model .
//
//-----------------------------------------
=end
require_relative "Guess"
require_relative "AbstractPlayer"
class InteractivePlayer < AbstractPlayer
  def initialize #constructor.
    puts "Human Player initialized. "
  end


  def setup(numplayers, index, suspects, locations, weapons)#this gives the player the info of the game
    super(numplayers, index, suspects, locations, weapons)
  end
  #setup



  def canAnswer(player_i,guess)  #checks if the player has the cards and can answer.

    puts "Asking player "+ @index.to_s

    # checking if the cards exist or not.
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
    #end check
    #check which card is to show.
    if(index1!=nil)
      print "Player "+ player_i.index.to_s + " asked you about "
      guess.printit

      if(index2!=nil)
        puts ". Which do you show?"
        puts "0 : " + @cards[index1].value
        puts "1 : " + @cards[index2].value
        if(index3!=nil)
          puts "2: " + @cards[index3].value
        end
        # result = gets.chomp.to_i
        result = 2
# check for validity
        if(index3!=nil)
          while(result < 0 || result > 2)
            puts "Not Valid. Try Again"
            result = gets.chomp.to_i
          end
        else
          while(result < 0 || result > 1)
            puts "Not Valid. Try Again"
            result = gets.chomp.to_i
          end
        end


        if(result == 0)
          result = index1
        elsif (result == 1)
          result = index2
        elsif (result == 2)
          result = index3
        end


# End check validity
      else #if index 2 is nil

        if(index3!=nil)
          puts "2: " + @cards[index3].value
          result = gets.chomp.to_i
          while(result!=0 || result!=2 )
            puts "Not Valid. Try Again"
            result = gets.chomp.to_i
          end

          if(result == 0)
            result = index1
          elsif (result == 1)
            result = index2
          elsif (result == 2)
            result = index3
          end

        else
          puts ", showed it to them,"
          result = index1
        end
      end
      puts "Player " + @index.to_s + " Answered."
      return @cards[result]
#index1 is nil
    elsif(index2!=nil)
      print "Player "+ player_i.index.to_s + " asked you about "
      guess.printit

      if(index3!=nil)
        puts ". Which do you show?"
        puts  "0: " + @cards[index2].value
        puts  "1: " + @cards[index3].value
        result = gets.chomp.to_i
      # check for validity
        while(result < 0 || result > 1)
          puts "Not Valid. Try Again"
          result = gets.chomp.to_i
        end
      # End check validity

        if(result == 0)
          result = index2
        elsif (result == 1)
          result = index3
        end

      else
        puts ", showed it to them,"
        result = index2
      end

      puts "Player " + @index.to_s + " Answered."
      return @cards[result]

    elsif(index3!=nil)
      print "Player "+ player_i.index.to_s + " asked you about "
      guess.printit
      puts ", showed it to them,"

      puts "Player " + @index.to_s + " Answered."
      return @cards[index3]
    else
      print "Player "+ player_i.index.to_s + " asked you about "
      guess.printit
      puts ", but you couldn't answer."
      return nil
    end
  end
  #CanAnswer



  def setCard(card) #Adds to the cards the player has.
    @cards.push(card)
  end #setCard.


  def getGuess
    puts "It is your turn."

    puts "Which person do you want to suggest?"
    printCards(@suspects)
    guessPerson = gets.chomp.to_i

    puts "Which location do you want to suggest?"
    printCards(@locations)
    guessPlace = gets.chomp.to_i

    puts "Which weapon do you want to suggest?"
    printCards(@weapons)
    guessWeapon = gets.chomp.to_i

    puts "Is this an accusation (Y/[N])?"
    value = gets.chomp.upcase

    if(value[0] == "Y")
      value = true
    else
      value = false
    end

    playerGuess = Guess.new(guessPerson, guessPlace, guessWeapon,value)

    return playerGuess
  end

  def receiveInfo(player_i , c)
    puts "Player " +player_i.to_s + " refuted your suggestion by showing you " + c.value
  end


  def printCards(list)
    j = 0
    list.each do |i|
      print j.to_s +  ": "
      i.printit
      j = j+1
    end
  end




end