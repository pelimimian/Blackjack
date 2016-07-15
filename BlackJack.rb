#Peter Elimimian
#CPSC 401

#!/usr/bin/ruby

$game_ended = false
# Dealer value
$dealer = rand(15..21)

def assign_names
random_card = rand(1..13)
#Using case statement and to use their own
    case random_card
    when (1 or 11)
        puts "Ace"
        puts "What value do you want for the Ace Card to be? 1 or 11?"
        value = gets.chomp
        if (value == "1")
            card_value = 1
        else
            card_value = 11
        end
    when 2
        card_value = 2
        puts "2"
    when 3
        card_value = 3
        puts "3"
    when 4
        card_value = 4
        puts "4"
    when 5
        card_value = 5
        puts "5"
    when 6
        card_value = 6
        puts "6"
    when 7
        card_value = 7
        puts "7"
    when 8
        card_value = 8
        puts "8"
    when 9
        card_value = 9
        puts "9"
    when 10
        card_value = 10
        puts "10"
    when 11
        card_value = 10
        puts "Jack"
    when 12
        card_value = 10
        puts "Queen"
    when 13
        card_value = 10
        puts "King"
    end 
    
    return card_value
end

puts "===Blackjack==="
puts "Drawing Two Cards...."
#Assigning local card variables to the return value of def assign_names
card_1 = assign_names
card_2 = assign_names
# Assigning the total to a card_total
card_total = card_1 + card_2

#Runs game until game_ended is True
until $game_ended == true

#If the first two cards are equal to 21, The player one!
if (card_total == 21)
    print "Card Value Total = "
    puts card_total   
    puts "Blackjack! You Win!"
    $game_ended = true
#If the card total is less than 21, they hit another card
elsif (card_total) < 21
    print "Card Value Total = "
    puts card_total
    puts "Do you want to draw another? Type Hit me! or Stay!"
    answer = gets.chomp
    if (answer == "Hit me!")
        next_card = assign_names
        card_total = card_total + next_card
        $game_ended = false
#If player wants to stay, it will compare the total value with the dealers card value        
    elsif(answer == "Stay!")
        if (card_total > $dealer)
          print "Dealer's Hand Total = "
          puts $dealer
          puts "Stand. You beat the Dealer. You Win!"
          $game_ended = true
        else
          print "Dealer's Hand Total = "
          puts $dealer
          puts "Stand. You lost the Dealer. You Lose!"
          $game_ended = true
        end
    end
    
#If the card total is greater than 21, they lose the game
elsif (card_total > 21 )
    print "Card Value Total = "
    puts card_total    
    puts "Bust! You Lose!"
    puts "Game Over"
    $game_ended = true

end
end