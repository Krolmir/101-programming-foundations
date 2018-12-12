# Remove everything starting from "house".

advice = "Few things in life are as important as house training "\
         "your pet dinosaur."

# If you use the .slice instead of .slice! advice will not be mutated
advice.slice!('Few things in life are as important as')
p advice