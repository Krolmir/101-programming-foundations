# throw out the really old people (age 100 or older).

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

ages.delete_if { |_, value| value >= 100 }

p ages

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 402, 'Eddie' => 10 }

p ages.reject { |_, v| v > 100 }
