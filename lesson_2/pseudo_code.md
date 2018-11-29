*A method that returns the sum of two integers

Casual
------

User is prompted to input a number and then store it as a variable num1
User is prompted to input a number and then store it as a variable num2
We turn num1 and num2 into integers and then add them together
We return the sum of the 2 numbers as a vairable sum and print it out to the user

Formal
------
 
START

GET num1
GET num2

SET num1 & num2 to integers
SET sum = num1 + num2

PRINT sum

END

*A method that takes an array of strings, and returns a string that is all those strings concatenated together

Casual
------

Given an array of strings.

Itterate through the collection one by one
  - Save the first value to a new variable temp
  - for each iteration after the first append to temp with a space before

Return temp after iterating through the collection

Formal
------

START

GET arr
SET iterator = 0

WHILE iterator <= length of arr
  IF iterator = 0 
    SET temp = value within arr at space "iterator" 
  ELSE 
    SET temp = temp + empty space + value within arr at space "iterator"
  
  iterator = iterator + 1

PRINT temp

END

*A method that takes an array of integers, and returns a new array with every other element

Casual
------

Given an array of integers

Iterate through a collection of integers one by one
  - When the index of the array is an odd number save the value to a new array

Returns the new array

Formal
------

START

GET arr
SET iterator = 0
SET new_arr  = empty array

WHILE iterator <= length of arr
  IF arr at index "iterator" = odd 
    SET new_arr = new_arr + value at index "iterator"
  
  iterator = iterator + 1

PRINT new_arr

END

    

