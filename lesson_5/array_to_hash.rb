# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

# itterate through the array using map to return a new array
# save first value as hash key and second as hash value

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = {}

arr.each { |v| new_hash[v[0]] = v[1] }

p new_hash
