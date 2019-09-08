#!/bin/bash
# Define function to show error messages.
error(){
        echo 'Usage- ./calculator.sh value1 operator value2'
        echo 'where,'
        echo 'value1: numeric value'
        echo 'value2: numeric value'
        echo 'operator: one of + , - , / , x'
        exit
}

# Check if there are exactly 3 arguments.
# If not then an error message and instructions will be printed.
if [ "$#" -ne "3" ]
    then
    error
fi

# Check if user is attempting to divide a number by 0.
if [ "$2" = "/" ] && [ "$3" -eq 0 ]
    then
        echo "Division-by-zero Error!"
        exit
fi

# Do the calculation.
let result=0
case $2 in
    +)	# Add the two numbers.
        result=`expr $1 + $3`       
	;;
    
    -)  # Subtract the second number from the first one.
        result=`expr $1 - $3`
        ;;

    /)  # Divide first number by the second one.
        result=`expr $1 / $3`
	##Floating point can be calculated by using the line below instead.
	##`bc <<< "scale=2; ${1}/${3}"`
        ;;

    x)  # Multiply the two numbers.
        result=`expr $1 \* $3`
	## Need to escape the * character.
        ;;

    *)  # Else print error message.
	error
	;;
esac

# Print the result.
echo $result

