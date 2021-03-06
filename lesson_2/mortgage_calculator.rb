# Mortgage Calculator

# Variables

loan_amount = ''
apr = ''
loan_duration = ''
loan_duration_months = ''
monthly_interest_rate = ''
result = ''

def valid_number?(num)
  if num.to_i < 0
    false
  elsif num =~ /^-?[0-9]+\.?-?[0-9]+$/ ||
        num =~ /^-?[0-9]+$/ ||
        num =~ /^-?[0-9]+\.?+$/
    true
  else
    false
  end
end

def invalid_loan_amount?(num)
  if !valid_number?(num)
    prompt "Invalid entry. Please enter a valid loan amount:"
    false
  elsif num == '0'
    prompt "0 is not a valid entry. Please enter a valid loan amount:"
    false
  else
    true
  end
end

def invalid_apr?(num)
  if !valid_number?(num)
    prompt "Invalid entry. Please enter a valid APR:"
    false
  else
    true
  end
end

def invalid_loan_duration?(num)
  if num.to_f % 1 != 0
    prompt "Invalid entry. Please enter a whole number:"
    false
  elsif !valid_number?(num)
    prompt "Invalid entry. Please enter a valid loan duration in years:"
    false
  elsif num == '0'
    prompt "0 is not a valid entry. Please enter a valid loan duration:"
    false
  else
    true
  end
end

def prompt(message)
  p "=>  #{message}"
end

def format_number(number)
  number = number.to_s.split('.')
  number[0].reverse!.gsub!(/(\d{3})(?=\d)/, '\\1,').reverse!
  number.join('.')
end

prompt "Welcome to the Mortgage Calculator!"

quit = true
until !quit

  prompt "Please enter the loan amount:"
  loop do
    loan_amount = gets.chomp
    loan_amount = loan_amount.gsub(/[\s,$]/, "")
    if invalid_loan_amount?(loan_amount)
      break
    end
  end

  prompt "Please enter the Annual Percentage Rate (APR):"
  loop do
    apr = gets.chomp
    apr = apr.gsub(/[\s%]/, "")
    if invalid_apr?(apr)
      break
    end
  end

  prompt "Please enter the loan duration (years):"
  loop do
    loan_duration = gets.chomp
    if invalid_loan_duration?(loan_duration)
      break
    end
  end

  monthly_interest_rate = apr.to_f / (12 * 100)
  loan_duration_months = loan_duration.to_i * 12

  if apr == '0'
    result = loan_amount.to_i / loan_duration_months
  else
    j = monthly_interest_rate
    i = loan_amount.to_i
    n = loan_duration_months
    result = i * (j / (1 - (1 + j)**-n))
  end

  prompt "Your monthly payments will be $#{format_number(result.ceil(2))}"
  prompt "For an initial loan of $#{format_number(loan_amount.to_i)}"
  prompt "The duration will be #{loan_duration_months} months."

  prompt "Use q to quit and anything else to continue with another calculation:"
  temp = gets.chomp.downcase
  if temp == "q" then quit = false end
end
