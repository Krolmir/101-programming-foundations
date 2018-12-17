# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically according to the numeric
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.each do |num|
  num.sort do |n1, n2| 
    n1 <=> n2 if n1.odd? && n2.odd?
  end
end

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# The sorted array should look like this:

[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
