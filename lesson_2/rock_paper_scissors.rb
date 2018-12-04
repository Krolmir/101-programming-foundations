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

# def win?(first, second)
#  (first == 'rock' && second == 'scissors') ||
#    (first == 'paper' && second == 'rock') ||
#    (first == 'scissors' && second == 'paper') ||
#    (first == 'rock' && second == 'lizard') ||
#    (first == 'paper' && second == 'spock') ||
#    (first == 'scissors' && second == 'lizard') ||
#    (first == 'lizard' && second == 'spock') ||
#    (first == 'lizard' && second == 'paper') ||
#    (first == 'spock' && second == 'rock') ||
#    (first == 'spock' && second == 'scissors')
# end

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

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}:")
    prompt("You may input either the full word or first letter of the word " \
    "(sp for spock & sc for scissors).")
    choice = gets.chomp
    choice = choice_abr(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer Chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
