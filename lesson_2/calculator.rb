# Calculator program that asks for 2 numbers and preforms an operation

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  if num =~ /^-?[0-9]+\.?-?[0-9]+$/ ||
     num =~ /^-?[0-9]+$/ ||
     num =~ /^-?[0-9]+\.?+$/
    true
  else
    false
  end
end

prompt MESSAGES['welcome']

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt MESSAGES['valid_name']
  else
    break
  end
end

prompt "Welcome #{name}!"

quit = true
until quit == false
  num1 = ''
  loop do
    prompt MESSAGES['input_num']
    num1 = gets.chomp
    if valid_number?(num1) != true
      prompt MESSAGES['invalid_num']
    else
      break
    end
  end

  num2 = ''
  loop do
    prompt MESSAGES['input_num']
    num2 = gets.chomp
    if valid_number?(num2) != true
      prompt MESSAGES['invalid_num']
    else
      break
    end
  end

  operator_prompt = <<-MSG
    Please enter what form of operation would you like to preform:
    'add'
    'subtract'
    'multiply'
    'divide'
  MSG
  prompt(operator_prompt)

  loop do
    operation = gets.chomp.downcase
    case operation
    when 'add'
      prompt "The result of adding your two numbers "\
      "is #{num1.to_i + num2.to_i}"
      break
    when 'subtract'
      prompt "The result of subtracting your two numbers "\
      "is #{num1.to_i - num2.to_i}"
      break
    when 'multiply'
      prompt "The result of multiplying your two numbers "\
      "is #{num1.to_i * num2.to_i}"
      break
    when 'divide'
      if num1 == 0 || num2 == 0
        prompt "You can not have '0' as a selected number "\
        "when dividing.  Please start over."
      else
        prompt "The result of dividing your two numbers "\
        "is #{num1.to_f / num2.to_f}"
        break
      end
    else
      prompt "Please make a valid selection: 'add' "\
      "'subtract 'multiply' 'divide':"
    end
  end

  prompt MESSAGES['quit']
  temp = gets.chomp.downcase
  if temp == "q" then quit = false end
end
