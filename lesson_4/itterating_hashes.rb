# Select all key value pairs where the value is 'Fruit'

# Input/Output will both be hashes

# Itterate through the keys of produce while checking their values
# If value is == Fruit retrun the keyvalue pair

def select_fruit(hash)
  key = hash.keys
  counter = 0
  new_hash = {}

  loop do
    break if counter == hash.size

    current_key = key[counter]
    current_value = hash[current_key]

    new_hash[current_key] = current_value if current_value == 'Fruit'

    counter += 1
  end

  new_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
