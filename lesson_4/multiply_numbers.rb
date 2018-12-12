# Multiply every array item by a specified value

def multiply(numbers, amount)
  multiplied_numbers = []
  count = 0

  loop do
    break if count == numbers.size

    multiplied_numbers << numbers[count] * amount
    count += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
