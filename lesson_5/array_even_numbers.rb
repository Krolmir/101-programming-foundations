# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]
       },
       {b: [2, 4, 6],
        c: [3, 6],
        d: [4]
       },
       {e: [8], 
        f: [6, 10]
       }
      ]

# Return should look like [{ b: [2, 4, 6], d: [4] }, {e: [8], f: [6, 10] }]

# Itterating through the array with map since we want a new array
# We want to have only the hashes that have even integers as values
# map through arr
# 

arr.map do |v|
  v.select do |_, v|
    v.all? { |n| n.even? }
  end
end
