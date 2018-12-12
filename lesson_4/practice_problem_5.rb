# Find the index of the first name that starts with "Be"

# Itterate through the array.
# - Checking to see if the string starts with Be
# - Once that condition is met break the itteration and return the index

# p flintstones.index { |name| name[0, 2] == "Be" } -- Alternative

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |str|
  if str.start_with?('Be')
    p flintstones.index(str)
    break
  end
end
