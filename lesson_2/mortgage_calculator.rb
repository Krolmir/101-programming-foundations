# Mortgage Calculator

# Variables

loan_amount = ''
apr = ''
loan_duration = ''
loan_duration_months = ''
monthly_interest_rate = ''
result = ''

def valid_number?(num)
  if num =~ /^-?[0-9]+\.?-?[0-9]+$/ ||
     num =~ /^-?[0-9]+$/ ||
     num =~ /^-?[0-9]+\.?+$/
    true
  else
    false
  end
end

def prompt(message)
  p "=>  #{message}"
end

prompt "Welcome to the Mortgage Calculator!"

quit = true
until quit == false

  prompt "Please enter the loan amount:"
  loop do
    loan_amount = gets.chomp
    loan_amount = loan_amount.gsub(/[\s,$]/, "")
    if valid_number?(loan_amount) != true
      prompt "Invalid entry. Please enter a valid loan amount:"
    elsif loan_amount == '0'
      prompt "0 is not a valid entry. Please enter a valid loan amount:"
    else
      break
    end
  end

  prompt "Please enter the Annual Percentage Rate (APR):"
  loop do
    apr = gets.chomp
    apr = apr.gsub(/[\s%]/, "")
    if valid_number?(apr) != true
      prompt "Invalid entry. Please enter a valid APR:"
    else
      break
    end
  end

  prompt "Please enter the loan duration (years):"
  loop do
    loan_duration = gets.chomp
    if valid_number?(loan_duration) != true
      prompt "Invalid entry. Please enter a valid loan duration in years."
    elsif loan_duration == '0'
      prompt "0 is not a valid entry. Please enter a valid loan duration:"
    else
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

  prompt "Your monthly payments will be $#{result.ceil(2)}"
  prompt "The duration will be #{loan_duration_months} months."

  prompt "Use q to quit and anything else to continue with another calculation"
  temp = gets.chomp.downcase
  if temp == "q" then quit = false end
end
