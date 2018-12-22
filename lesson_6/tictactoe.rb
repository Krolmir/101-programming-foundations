# TicTacToe

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagnals

def prompt(msg)
  puts "=> #{msg}"
end

def display_score(player_score, computer_score, user = 'Player 1')
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
  prompt "Choose a square. Options: #{joinor(empty_squares(brd))}"
  square = ''
  loop do
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Invalid choice. Please choose a valid square."\
    " Options:#{joinor(empty_squares(brd))}:"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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

loop do
  player = 0
  computer = 0
  name = ''

  loop do
    prompt "Please enter a user name (Maximum of 10 characters):"
    name = gets.chomp

    if name.length > 10
      prompt "Invalid name entry."
    else
      break
    end
  end

  loop do
    board = initialize_board

    loop do
      puts "\e[H\e[2J"
      display_score(player, computer, name)

      display_board(board)
      player_places_piece!(board)
      break if someone_won?(board, name) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board, name) || board_full?(board)
    end

    if player_win?(board)
      player += 1
    elsif computer_win?(board)
      computer += 1
    end

    puts "\e[H\e[2J"
    display_score(player, computer, name)
    display_board(board)

    if someone_won?(board, name)
      prompt detect_winner(board, name)
    end

    if board_full?(board) && !someone_won?(board, name)
      prompt "It's a Tie!"
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
