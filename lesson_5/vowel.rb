# Using the each method, write some code to output all of the vowels from
# the strings.



hsh = {first: ['the', 'quick'],
       second: ['brown', 'fox'],
       third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.each do |_, v|
  p v.join.scan(/[aeiou]/)
end
