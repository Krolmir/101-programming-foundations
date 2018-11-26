# Calculator program that asks for 2 numbers and a form of mathematical operation (add, subtract, multiply, divide)
quit = true
until quit == false do
  puts "Please input a number:"
  num_1 = gets.chomp
  if num_1 =~ /^-?[0-9]+$/
  else  
    puts "You have entered an invalid Integer. Please start over."
    redo
  end

  puts "Please input another number:"
  num_2 = gets.chomp
  if num_2 =~ /^-?[0-9]+$/
  else  
    puts "You have entered an invalid Integer. Please start over."
    redo
  end
  
  puts "Please enter what form of operation would you like to preform ('add', 'subtract', 'multiply', 'divide'):"
  operation = gets.chomp.downcase
  
  if operation == "add" then puts "The result of adding your two numbers is #{num_1.to_i + num_2.to_i}"
  elsif operation == "subtract" then puts "The result of subtracting your two numbers is #{num_1.to_i - num_2.to_i}"
  elsif operation == "multiply" then puts "The result of multiplying your two numbers is #{num_1.to_i * num_2.to_i}"
  elsif operation == "divide" then
    if num_1 == 0 || num_2 == 0
      puts "You can not have '0' as a selected number when dividing.  Please start over."
      redo
    else
      puts "The result of dividing your two numbers is #{num_1.to_f / num_2.to_f}"
    end
  else
    puts "You have entered an invalid operation selection. Please start over."
    redo
  end
  puts "Hit enter to continue or q to quit: "
  temp = gets.chomp.downcase
  if temp == "q" then quit = false end
end

  
  