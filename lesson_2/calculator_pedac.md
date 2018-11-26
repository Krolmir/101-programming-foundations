Build a command line calculator program that does the following:

asks for two numbers
asks for the type of operation to perform: add, subtract, multiply or divide
displays the result
Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. 
Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().



Identify input / output
-----------------------

Input 

- two numbers
- type of operation (+, -, /, *)

Output

- result of the two numbers + the operation in action

Implicit Requirements
---------------------

1. The 2 numbers given must be integers
2. If we are choosing the division operator we will not allow 0 to be chosen as a number
3. When the user is entering the operator it will not be case sensitive

Clarifying Questions
--------------------

1. The numbers will be inputed seperately and saved as 2 seperate variables. 
2. The operation will also be saved as a seperate variable
3. If a non integer is inputed than the program will prompt the user to try again
4. If division is selected and the user inputed a 0 the program will reset and prompt the user to try
   again with the proper input
5. The user will input the type of opperation they want through a string and then we will map those string
   inputs to a mathematical operation

Mental Model
------------

Ask the user to input 2 seperate numbers. Save them as 2 unique values. Ask the user to then input an operation.
Check any necessary requirements and then process the operation on the 2 numbers and return the result.

Validation
----------
1.

Inputs: 
- 5, 8
- Multiplication

Output
- 40

2.

Inputs:
- 10, 5
- addition

Output
- 15

3.

Inputs:
-25, 0
-Division

Output
-error and prompt for the user to try again and start from beginning

DataStructure
-------------
Numbers will be saved as integers
result will return an integer variable

Algorithm
---------
1. User is prompted to enter a number.
    If the number entered is not a valid integer user will be prompted to try again
2. User is prompted to enter another number.
    If the number entered is not a valid integer than the user will be prompted to try agian
3. User is prompted to enter one of the following operations (add, subtract, divide, multiply)
    if user chooses add then we will add the 2 numbers
    else if user chooses subtract we will subtract the first number by the second number
    else if user chooses multiply we will multiply the 2 numbers
    else if user chooses divide we will first check that there are no 0's 
      if there is a 0 then send user to the start of the program and have them enter new numbers
      else continue and divide the first number by the second number
    else user has entered an invalid choice and will be prompted to try again
4. Print result







