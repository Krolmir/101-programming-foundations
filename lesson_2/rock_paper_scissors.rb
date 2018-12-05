# rock_paper_scissors.rb
VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  p "=> #{message}"
end

def rock_win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard')
end

def paper_win?(first, second)
  (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock')
end

def scissors_win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard')
end

def lizard_win?(first, second)
  (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper')
end

def spock_win?(first, second)
  (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def win?(first, second)
  rock_win?(first, second) ||
    paper_win?(first, second) ||
    scissors_win?(first, second) ||
    lizard_win?(first, second) ||
    spock_win?(first, second)
end

def choice_abr(str)
  if str == 'r'
    'rock'
  elsif str == 'p'
    'paper'
  elsif str == 'l'
    'lizard'
  elsif str == 'sc'
    'scissors'
  elsif str == 'sp'
    'spock'
  else
    str
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end

def check_total?(player, computer)
  if player == 5
    prompt("----------------------------------------------------------------")
    prompt("You have beaten the computer! Congratulations!")
    prompt("----------------------------------------------------------------")
  elsif computer == 5
    prompt("----------------------------------------------------------------")
    prompt("Sorry, but you have been beaten by the computer. Better "\
     "luck next time!")
    prompt("----------------------------------------------------------------")
  end
end

loop do
  prompt("----Welcome to Rock Paper Scissors Lizard Spock----")
  prompt("This is a best out of 9 series against the computer")
  prompt("Best of luck!!!")
  prompt("----------------------------------------------------------------")
  prompt("You may input either the full word or the first letter of each " \
      "word (sp for spock & sc for scissors).")
  choice = ''
  player_total = 0
  computer_total = 0

  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}:")

      choice = gets.chomp.downcase
      choice = choice_abr(choice)

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("-----That's not a valid choice.-----")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer Chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_total += 1
    elsif win?(computer_choice, choice)
      computer_total += 1
    end

    break if check_total?(player_total, computer_total)

    prompt("----- Scoreboard -----")
    prompt("Player1: #{player_total} Computer: #{computer_total}")
    prompt("Lets go again!")
  end

  prompt("Do you want to play again? Enter y for yes or anything else for no:")
  answer = gets.chomp.downcase
  break unless answer == 'y'
end

prompt("Thank you for playing. Have a nice day!")
