# Create a hash that expresses the frequency with which each letter occurs
# in this string:

# Turn the string into only characters (delete spaces)
# Itterate through each character (Maybe turn it into an array or something)
# check to see if that character exists in the dummy hash
# - if not add a new entry to the hash with key as char and value as 1
# - elsif add + 1 to the parallel key

# ex { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = 'The Flintstones Rock'

new_statement = statement.delete(' ').chars.sort
chars_hash = {}

new_statement.each do |char|
  if chars_hash.key?(char)
    chars_hash[char] += 1
  else
    chars_hash[char] = 1
  end
end

p chars_hash
