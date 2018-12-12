# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

flintstones = %w(Fred Barney Wilma Betty Pebbles BamBam)

flintstones_hash = flintstones.each_with_object({}) do |value, hash|
  hash[value] = flintstones.index(value)
end

p flintstones_hash
