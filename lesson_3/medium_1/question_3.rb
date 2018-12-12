# make this work without using begin/end/until

def factors(number)
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
end

def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end