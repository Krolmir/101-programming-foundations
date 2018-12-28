# twentyone.rb

# Constants
RANK = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
SUIT = ['♣', '♥', '♠', '♦']
VALUE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
          '9' => 9, '1' => 10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }
ESCAPE = 'x'

# Methods
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck(ranks, suits)
  cards = []
  ranks.each do |rank|
    suits.each do |suit|
      cards << "|#{rank + suit}|"
    end
  end
  cards.shuffle!
end

def reset_screen
  puts "\e[H\e[2J"
end

def dealer_initial_cards(deck)
  dealer_cards = []
  dealer_cards << deck.pop
  dealer_cards << deck.pop
  dealer_cards
end

def dealer_cards(deck)
  dealer_initial_cards(deck)
end

def player_initial_cards(deck)
  player_cards = []
  player_cards << deck.pop
  player_cards << deck.pop
  player_cards
end

def hit_me(deck, player_cards)
  player_cards << deck.pop
  player_cards
end

def display_initial_table(player, dealer_cards, player_cards, player_total)
  puts "                TWENTY ONE!                "
  puts "___________________________________________"
  puts "|                                          |"
  puts "| Dealer:  #{dealer_cards[0]}|  |"
  puts "|                                          |"
  puts "| Dealer total: #{value_of_card(dealer_cards[0][1])}"
  puts "|__________________________________________|"
  puts "|                                          |"
  puts "| #{player}:  #{player_cards.join}"
  puts "|                                          |"
  puts "| Current total: #{player_total}"
  puts "|__________________________________________|"
  spacer
end

def spacer
  puts "----------------------------"
end

def display_table(player, dealer_cards, player_cards, dealer_total,
                  player_total)
  puts "                TWENTY ONE!                "
  puts "___________________________________________"
  puts "|                                          |"
  puts "| Dealer:  #{dealer_cards.join}"
  puts "|                                          |"
  puts "| Dealer total: #{dealer_total}"
  puts "|__________________________________________|"
  puts "|                                          |"
  puts "| #{player}:  #{player_cards.join}"
  puts "|                                          |"
  puts "| Current total: #{player_total}"
  puts "|__________________________________________|"
  spacer
end

def get_total(total, cards, modified_ace_count)
  total = 0
  cards.each do |card|
    temp = VALUE.values_at(card[1])
    total += temp[0]
  end
  total - (modified_ace_count * 10)
end

def value_of_card(card)
  VALUE.values_at(card).join.to_i
end

def ace_counting(cards)
  ace_count = 0
  cards.each do |card|
    if value_of_card(card[1]) == 11
      ace_count += 1
    end
  end
  ace_count
end

def choose_option
  prompt "Would you like to hit or stay?"
  prompt "Type 'hit' or 'stay'"
  gets.chomp.downcase
end

def exit_prompt
  prompt "x to exit. Anything else to play again"
  gets.chomp.downcase
end

def valid_name?(name)
  if name.length > 10 || name.length < 2 || name =~ /[^A-Za-z0-9]+/
    true
  else
    false
  end
end

def check_total(total, modified_count, ace_count)
  if total > 21
    if modified_count < ace_count
      2
    else
      -1
    end
  elsif total == 21
    1
  elsif total < 21
    0
  end
end

# Local Variables
name = ''

# Algorithm
spacer
prompt "Welcome to Twenty-One!"
spacer
prompt "For a full list of rules please enter 'r'. Otherwise hit enter to "\
       "continue."
rules = gets.chomp.downcase

if rules == 'r'
  reset_screen
  File.open("twenty_one_rules.txt").each do |line|
    puts line
  end
  prompt "Hit enter to continue."
  gets.chomp
  reset_screen
end

reset_screen

loop do
  spacer
  prompt "Please enter a user name: "
  prompt "Letters & Numbers only"
  prompt "Minimum of 2 characters & Maximum of 10 characters"
  spacer
  name = gets.chomp

  if valid_name?(name)
    prompt "Invalid name entry."
  else
    break
  end
end

# Main loop algoritm

# First thing we check is if the computer has 21. If they have 21 and player
# does not then computer instantly wins (even though we don't show their second
# card..... Maybe add a delay where it says dealer is checking if they have
# 21 over a few seconds and then continue if they dont and flip their card if
# they do)

# 1. get player total
#   - if this is the first itteration and total = 21 player wins and has black
#     jack and game ends
#   - elsif computer_total == 21 computer wins
#   - elsif total = 21 move on to step 2
#   - elsif total > 21
#     - if player has an Ace change value to 1 and go back to step 1
#     - else player busts/loses and game ends
#   - elsif total < 21 let player choose if they wanna hit or stay
#     - if player hits pop another card to their total/player cards.
#       - Return back to step 1
#     - elsif player stays go to next step

# 2. get computer total (show second initial card as well at this point)
#     - if total >= 17 move on to next step
#     - elsif total <= 16 computer hits and returns to step 2
#     - elsif total > 21 computer
#       - if computer has an Ace change value to 1 and go back to step 1
#       - else computer busts/loses and game ends

# 3. compare player total <=> computer total
#     - if player total > computer total: Player wins
#     - elsif computer total > player total: Computer wins
#     - elsif computer total == player total: Tie

loop do
  # Local Variables
  deck = []
  dealer_cards = []
  player_cards = []
  player_total = 0
  dealer_total = 0
  action = ''
  modified_count = 0
  ace_count = 0
  d_ace_count = 0
  d_modified_count = 0
  p_check_total = 0
  d_check_total = 0

  reset_screen
  deck = initialize_deck(RANK, SUIT)
  dealer_cards = dealer_initial_cards(deck)
  player_cards = player_initial_cards(deck)

  dealer_total = get_total(dealer_total, dealer_cards, d_modified_count)
  player_total = get_total(player_total, player_cards, modified_count)
  display_initial_table(name, dealer_cards, player_cards, player_total)

  loop do
    p_check_total = check_total(player_total, modified_count, ace_count)
    if p_check_total == 1
      prompt "Black Jack!!! #{name} Wins!"
      break
    elsif value_of_card(dealer_cards[0][1]) == 10 ||
          value_of_card(dealer_cards[0][1]) == 11
      prompt "Checking to see if dealer has black jack....."

      sleep 3 # seconds
      d_ace_count = ace_counting(dealer_cards)
      d_check_total = check_total(dealer_total, d_modified_count, d_ace_count)

      case d_check_total
      when 1
        reset_screen
        display_table(name, dealer_cards, player_cards, dealer_total,
                      player_total)
        spacer
        prompt"Sorry, but the dealer has Black Jack. You lose."
        spacer
        break
      when 2
        dealer_total -= 10
        d_modified_count += 1
        prompt "Dealer does not have Black jack! Let's continue!"
        spacer
      else
        prompt "Dealer does not have Black jack! Let's continue!"
        spacer
      end
    end

    loop do
      action = choose_option

      case action
      when 'hit'
        hit_me(deck, player_cards)
        reset_screen

        player_total = get_total(player_total, player_cards, modified_count)
        ace_count = ace_counting(player_cards)
        p_check_total = check_total(player_total, modified_count, ace_count)
        display_initial_table(name, dealer_cards, player_cards, player_total)

        case p_check_total
        when -1
          prompt "Your total is #{player_total}"
          prompt "Sorry but you have busted."
          break
        when 1
          prompt "You have 21! Lets see what the dealer has."
          break
        when 2
          player_total -= 10
          modified_count += 1
        end
      when 'stay'
        break
      else
        prompt "Invalid Entry. Please enter a valid option:"
      end
    end

    break if p_check_total == -1

    spacer
    prompt "Dealers turn..."
    spacer
    sleep 3

    loop do
      reset_screen
      display_table(name, dealer_cards, player_cards, dealer_total,
                    player_total)
      spacer
      prompt "The dealer has #{dealer_total}"

      if dealer_total < 17
        hit_me(deck, dealer_cards)
        spacer
        prompt "Dealer has hit..."
        spacer

        sleep 3

        dealer_total = get_total(dealer_total, dealer_cards, d_modified_count)
        d_ace_count = ace_counting(dealer_cards)
        d_check_total = check_total(dealer_total, d_modified_count, d_ace_count)
        reset_screen
        display_table(name, dealer_cards, player_cards, dealer_total,
                      player_total)

        case d_check_total
        when -1
          prompt "The Dealer has busted. #{name} wins!"
          break
        when 1
          prompt "Dealer has 21."
          break
        when 2
          dealer_total -= 10
          d_modified_count += 1
        end

      elsif dealer_total > 16
        prompt "The dealer stays."
        break
      end
    end

    break if d_check_total == -1

    # Comparing computer total to player total
    if player_total > dealer_total
      spacer
      prompt "Congratulations #{name}!! You have beaten the dealer."
      break
    elsif player_total < dealer_total
      spacer
      prompt "Sorry #{name}. The dealer has beaten you."
      break
    elsif player_total == dealer_total
      spacer
      prompt "It's a tie!"
      break
    end
  end

  spacer
  escape_command = exit_prompt
  spacer
  break if escape_command == ESCAPE
end
