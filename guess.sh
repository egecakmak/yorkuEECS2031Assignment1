#!/bin/bash

# Clear the screen and welcome player.
clear
echo "Welcome to the number game."
echo "Guess a number between 1 and 64 (inclusive)"

# Define the random number and number of times to let the player try.
randomNumber=`expr $RANDOM % 64 + 1`
times=6

# Check the number given by the user and display messages accordingly.
while [ "$times" -gt 0 ]
do
    # Read the input from the user.	
    read input

   	# Check if the input is valid. (i.e if the input is a number)
	# If not, then warn the user. But do not decrement times. 	
	if ! [[ "$input" =~ ^[0-9]+$ ]] ; 
	    then
		 echo "Your input should only be numbers and it should be within range 1 - 64 (inclusive)"
		 continue
	fi
	
	
	
	# Check if the input is within range.
	# If not, then warn the user. But do not decrement times.
	if [ "$input" -lt "1" ] || [ "$input" -gt "64" ]
	    then
		echo "Your input should be within range 1 - 64 (inclusive)"   
		continue
	fi
	

	

	# Check user's input and show messages accordingly.
        if [ "$input" -eq "$randomNumber" ]    
            then 
                echo "You won!"
                exit
            elif [ $input -lt "$randomNumber" ]
                then
                    echo "Too small."
            else
                echo "Too big"	
        fi
	
	# Decrement times by one.
	times=`expr $times - 1`
	
	# Print "Try Again." if there are any tries left.
	if [ "$times" -gt "0" ]
	    then
		echo "Try again."
	fi

done

# If user reaches this point it means that he didn't win.
echo "You lost!"

