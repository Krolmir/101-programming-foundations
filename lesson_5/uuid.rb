# It accomplishes this feat through massive randomization. The number of
# possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken
# into 5 sections like this 8-4-4-4-12 and represented as a string.

# explicit rules
# - 5 sections 8-4-4-4-12
# - each character is a hexadecimal or 0-9 & a-f

# uuid will return a random 32 hexadecimal character
# output will be a string in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# sample 0-9 & a-f 8* "-" sample 0-9 & a-f 4* "-" sample 0-9 & a-f 4* "-" 
# sample 0-9 & a-f 4* "-" sample 0-9 & a-f 12*

def uuid()
  8.times.map { [*'0'..'9', *'a'..'f'].sample }.join + "-" + \
  4.times.map { [*'0'..'9', *'a'..'f'].sample }.join + "-" + \
  4.times.map { [*'0'..'9', *'a'..'f'].sample }.join + "-" + \
  4.times.map { [*'0'..'9', *'a'..'f'].sample }.join + "-" + \
  12.times.map { [*'0'..'9', *'a'..'f'].sample }.join
end

p uuid()
p uuid()
p uuid()
p uuid()
