Assignment: Mortgage / Car Loan Calculator
------------------------------------------

Inputs
------

1. the loan amount
2. the Annual Percentage Rate (APR)
3. the loan duration

Outputs
-------

1. monthly interest rate (internally calculated)
2. loan duration in months (internally calculated)
3. monthly payments is end game**

Given
-----

m = p * (j / (1 - (1 + j)**(-n)))
m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

Requirements
------------

1. loan amount must be in dollars
2. anything that is a % needs to be expressed as a decimal. i.e 5% = 0.05
		- now we can either ask the user to enter a converted form, or have it converted in the backend
3. loan duration will be inputed as years and needs to be turned into months
4. APR needs to be converted to a monthly interest rate (Maybe APR as a decimal (.xx / 12) x total loan amount)
5. all returns will be rounded up to the second decimal. i.e 5034.33 23913.21

Clarifying Questions
--------------------

1. loan amount will be stored as a variable and will only accept numbers that follow the xx.xx base (regex)
2. The APR will be inputed as a % and then translated to a x.xx number
	- it will then be turned into a monthly interest rate.(Maybe APR as a decimal (.xx / 12) x total loan amount)
3. loan duration will be inputed as years then translated into months


Mental Model
------------

The user is going to enter the loan amount and the APR and the desired loan duration.
The program will then take the inputed information to calculate 3 things.
	1. return the monthly interest rate, 
	2. the loan duration in months, 
	3. and most importantly the montly payments.


Examples/Test Cases
-------------------

Inputs 
- Loan amount $100,000
- APR 10%
- Duration 10 years

Outputs
- Monthly Interest Rate = 10 / (12 * 100) chopped to 2 decimal places when outputed but calculated properly 0.0084
- Loan Duration (months) = 120
- mothly payments = 100,000 * (0.0084 / (1 - (1 + 0.0084) ** (-120)))
-   = 100,000 * (0.0084 / (1 - 0.3665)
-   = 100,000 * (0.0084 / 0.6335)
-   = 100,000 * 0.0133
-   = $1,330

Inputs 
- Loan amount $750,000
- APR 12%
- Duration 30 years

Outputs
- Monthly Interest Rate = 12 / (12 * 100) chopped to 2 decimal places when outputed but calculated properly 0.01
- mothly payments = 750,000 * (0.01 / (1 - (1 + 0.01) ** (-360)))
-   = 750,000 * (0.01 / (1 - 0.0279)
-   = 750,000 * (0.01 / 0.9721)
-   = 750,000 * 0.0103
-   = $7,725

Data Structures
---------------

Input 
-loan = integer
-APR = float
-duration = integer
-monthly interest rate = float
-loan duration months = integer
-monthly payments = float

Algorithm
---------

1. greet user and ask for them to input the desired loan size
	- check if the number is a number 
2. ask the user to input a loan period in years
	- check to make sure its a whole number
	- turn years into months for later use and store it in a variable
3. ask user for the APR. This we will accept decimal numbers
	- again check format 
	- turn the apr into the monthly interest rate and store it in a varible
4. calculate the monthly payments with all the data above
5. return the monthly payments with a prompt and possibly let them know the term length in months
6. ask user if they want to quit or preform another calculaton

Psuedo code 
------------

START

SET loan_amount = ''
SET apr = ''
SET loan_duration =''
SET result = ''

GET loan 
GET apr
GET duration

SET monthly_interest_rate = apr / (12 * 100)
SET loan_duration_months = loan_duration * 12
SET result = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** (-loan_duration_months)))

PRINT result + some greeting

END