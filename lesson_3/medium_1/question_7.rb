# How can we refactor this practice problem to make the result easier 
# to predict and easier for the next programmer to maintain?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8