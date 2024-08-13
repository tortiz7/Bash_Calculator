#!/bin/bash
# Alright, time to make a Bash calculator! First, we declare the variable "i" as "y" before the while loop
i="y"

# The while loop is so that when the user inputs "Y" or "y" when asked if they want to continue at the end, the script will start again
while [ "$i" = "Y" ] || [ "$i" = "y" ]
do

#A greeting, followed by a request for a number - the script then reads the number and uses it for the operations below
  echo "Welcome to Bash Calculator 3000! Feed me 2 numbers :)"
  echo -n "The 1st tasty number please: "
  read n1
  echo "YUM!"

# Requests the second number to be used in the operation to follow
  echo -n "and now snack number 2: "
  read n2
  echo "YUMYUM!"
  echo "Time for MATH!!"
  sleep 1

# The below if statement ensures that only actual integers are used when a number is requested, and will output the corrective message when anything not matching 1-9 is used
  if ! [[ "$n1" =~ ^-?[0-9]+$ ]] || ! [[ "$n2" =~ ^-?[0-9]+$ ]]; then
    echo "Choose a number silly goose!!"
    continue
  fi

#Here is our list of operations possible when doing arthimetic via Bash. The number of th operation sets the pattern used for the case statement
#The case statement is used here to simplify the script, so we're not using multiple nested if statements 
  echo "1.subtraction"
  echo "2.addition"
  echo "3.multiplication"
  echo "4.division"
  echo "enter your choice"
  read ch
  case $ch in
	1) result=$((n1 - n2))
	  echo "Result = $result";;
	2) result=$((n1 + n2))
	  echo "Result = $result";;
	3) result=$((n1 * n2))
	  echo "Result = $result";;
	4) if [ $n2 -ne 0 ]; then  #the -ne means "not equal", ensuring the script catches a divsion by 0 request as an error
	    result=$((n1 / n2))
	    echo "Result  = $result"
	   else
	    echo "invalid choice: division by zero UNACCETABLE!!"
	   fi
	   ;;
	*)
          echo "Try again!!";;
  esac

#The below request is looking for the "Y" variable, which will restart the script if found. Otherwise, the user is greeted with a goodbye message
  echo "do you want to continue? (Y or N)"
  read i
done

echo "Hope you enjoyed the Bash Calculator 3000!! Have a good one!"
#Hope you enjoyed my first Bash calculator!
