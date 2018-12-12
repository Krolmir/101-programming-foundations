# Pick out the minimum age from our current Munster family hash:

# ages.values.min -----owned

ages = { 'Herman' => 32,
         'Lily' => 30,
         'Grandpa' => 5843,
         'Eddie' => 10,
         'Marilyn' => 22,
         'Spot' => 237 }

smallest = ages.values.sort!

p "The youngest Munster is #{ages.key(smallest.first)} with an age of "\
  "#{smallest.first}"
