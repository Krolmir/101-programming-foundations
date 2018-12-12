# Write your own version of the rails titleize implementation.

# Split the string into an array.
# Itterate through the array and capitalize each word
# turn the array back into a string

# words.split.map { |word| word.capitalize }.join(' ') -alternative solution

words = 'the flintstones rock'

cap_words = words.split

cap_words.each(&:capitalize!)

p cap_words.join(' ')
