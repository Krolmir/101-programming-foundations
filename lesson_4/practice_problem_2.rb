# Add up all of the ages from the Munster family hash:

ages = { 'Herman' => 32,
         'Lily' => 30,
         'Grandpa' => 5843,
         'Eddie' => 10,
         'Marilyn' => 22,
         'Spot' => 237 }

ages_array = ages.values

sum = 0
ages_array.each { |age| sum += age }

p sum

sum = 0
ages.each { |_, age| sum += age }

p sum
