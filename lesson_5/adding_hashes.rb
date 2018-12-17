# figure out the total age of just the male members of the family.

# itterate through the hash
# check if gender = male
# age +=

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

total = 0

munsters.each do |_, v|
  total += v['age'] if v['gender'] == 'male'
end

p "The total age of all the males in the munster family is #{total}"
