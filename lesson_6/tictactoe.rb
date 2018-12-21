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

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts `clear`
  puts "You're #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
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
    " Options:#{empty_squares(brd).join(', ')}:"
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

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "You have won!"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "The Computer has won!"
    end
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
  board = initialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt detect_winner(board)
  end

  if board_full?(board) && !someone_won?(board)
    prompt "It's a Tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye (:"
