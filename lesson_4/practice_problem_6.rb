# Amend this array so that the names are all shortened to just the first
# three characters:

# Itterate through the array. Probably with each
# As you loop through return the first 3 charcaters to a new array
# slice! 0-2

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each { |str| str.slice!(3..str.length) }

p flintstones
