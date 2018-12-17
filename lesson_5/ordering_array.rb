# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

p arr.max(arr.length) { |a, b| a.to_i <=> b.to_i }
