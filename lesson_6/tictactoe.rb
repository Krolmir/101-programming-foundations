# TicTacToe

require 'pry'

PLAYER_FIRST = 'y'
COMPUTER_FIRST = 'c'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagnals

def prompt(msg)
  puts "=> #{msg}"
end

def reset_screen(brd, player, computer, name)
  puts "\e[H\e[2J"
  display_score(player, computer, name)
  display_board(brd)
end

def display_score(player_score, computer_score, user)
  puts "_________________________________"
  puts user + ': ' + PLAYER_MARKER + '   ' + player_score.to_s + '|' +
       computer_score.to_s + '   ' + 'Computer: ' + COMPUTER_MARKER
  puts "_________________________________"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  prompt "Choose a square based on the lower desciption. Options: "\
  "#{joinor(empty_squares(brd))}"
  puts ' 1 | 2 | 3 '
  puts '---|---|---'
  puts ' 4 | 5 | 6 '
  puts '---|---|---'
  puts ' 7 | 8 | 9 '

  square = ''

  loop do
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Invalid choice. Please choose a valid square."\
    " Options:#{joinor(empty_squares(brd))}:"
  end

  brd[square] = PLAYER_MARKER
end

def computer_defense(brd)
  high_risk?(brd, PLAYER_MARKER).each do |v|
    if brd[v] == INITIAL_MARKER
      return brd[v] = COMPUTER_MARKER
    end
  end
end

def computer_offense(brd)
  high_risk?(brd, COMPUTER_MARKER).each do |v|
    if brd[v] == INITIAL_MARKER
      return brd[v] = COMPUTER_MARKER
    end
  end
end

def computer_ai(brd)
  if high_risk?(brd, COMPUTER_MARKER)
    computer_offense(brd)
  elsif high_risk?(brd, PLAYER_MARKER)
    computer_defense(brd)
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def high_risk?(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, user)
  !!detect_winner(brd, user)
end

def player_win?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return true
    end
  end
  nil
end

def computer_win?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return true
    end
  end
  nil
end

def detect_winner(brd, user)
  if player_win?(brd)
    return "#{user} has won!"
  elsif computer_win?(brd)
    return "The Computer has won!"
  end
  nil
end

# I have compressed this method a few times to satisfy rubocops AbcSize
# complaint. Don't know if this was the most efficient way, but came down to
# these two methods below.

def range(brd, delimiter)
  brd[0..brd.length - 2].join(delimiter)
end

def joinor(brd, delimiter = ', ', conj = 'or')
  range = range(brd, delimiter)
  last = brd.last.to_s
  if brd.length > 1
    if brd.length == 2
      range + ' ' + conj + ' ' + last
    else
      range + delimiter + conj + ' ' + last
    end
  else
    range
  end
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_ai(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  elsif current_player == 'computer'
    'player'
  end
end

def current_player_set(choose)
  if choose == PLAYER_FIRST
    'player'
  elsif choose == COMPUTER_FIRST
    'computer'
  end
end

loop do
  player = 0
  computer = 0
  name = ''
  choose = ''
  current_player = ''
  counter = 0

  loop do
    prompt "Please enter a user name (Minimum of 2 characters & "\
           "Maximum of 10 characters):"
    name = gets.chomp

    if name.length > 10 || name.length < 2
      prompt "Invalid name entry."
    else
      break
    end
  end

  loop do
    prompt "Please choose who you would like to go first (Y for you or"\
           " C for computer)"
    choose = gets.chomp.downcase
    if choose == PLAYER_FIRST
      break
    elsif choose == COMPUTER_FIRST
      break
    else
      prompt "Invalid entry. Try again. :P"
    end
  end

  loop do
    board = initialize_board
    current_player = current_player_set(choose)

    loop do
      reset_screen(board, player, computer, name)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board, name) || board_full?(board)
    end

    if player_win?(board)
      player += 1
    elsif computer_win?(board)
      computer += 1
    end

    reset_screen(board, player, computer, name)

    if someone_won?(board, name)
      prompt detect_winner(board, name)
      counter += 1
    end

    if board_full?(board) && !someone_won?(board, name)
      prompt "It's a Tie!"
      counter += 1
    end

    if player == 5
      puts "Congratulations #{name}! You have beaten the computer in a race"\
           " to 5 wins!"
      break
    elsif computer == 5
      puts "The computer has won the race to 5 wins! Better luck next time."
      break
    end

    prompt "Please press enter to continue."
    gets
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye (:"
