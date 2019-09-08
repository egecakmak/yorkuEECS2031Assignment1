#!/bin/bash
# Define menu options.
menuOption1='1. Ongoing Processor Activity'
menuOption2='2. Users Currently logged in'
menuOption3='3. Number of users currently logged in'
menuOption4='4. Users with bash shell'
menuOption5='5. Exit'

# Define strings.
menuFrame='---------------------------'
menuName='M A I N - M E N U'
askForOptions='Please enter option [1-5]:'
case2String='Users Currently Logged in : '
case3String='Number of users currently logged in is : '
case4String='Users with bash shell : '
enterString='Press [enter] key to continue'
topPromptString='You will now be directed to "top" to view the Ongoing Processor Activity.' 
topPromptString2='You may exit "top" by pressing key "q".'
topPromptString3='Press [enter] when you are ready to proceed.'
invalidInputString='Your input needs to be within range [1-5].'
invalidInputString2='Your input need to be a number and it should be within range [1-5].'
# Show the menu.
showMenu(){
    clear
    echo $menuFrame
    echo $menuName
    echo $menuFrame
    echo $menuOption1
    echo $menuOption2
    echo $menuOption3
    echo $menuOption4
    echo $menuOption5
    echo $menuFrame
    echo -n $askForOptions
}

# Shows the main menu using the showMenu 
# function until user wants to exit.
# Lets user supply an input and 
# returns the result accordingly.
while :
do
    showMenu
    read input
	
	# Check if the input is valid. (i.e if the input is a number)
	if ! [[ "$input" =~ ^[0-9]+$ ]] ; 
	then
		 echo $invalidInputString2
		 echo $enterString
        	 read DUMMY
		 continue
	fi
	
	
	# Check if the input is within range.
   	if [ $input -lt "1" ] || [ $input -gt "5" ]
	then
	   echo $invalidInputString
 	   echo $enterString
           read DUMMY
	   continue
	fi

    case $input in
        1)
	   # Start top.
	   # Prompt user that they can exit top with key "q".
	   echo $topPromptString
	   echo $topPromptString2
	   echo $topPromptString3
	   read DUMMY
           top
	   echo $enterString
           read DUMMY
           ;;
        2) 
	   # Runs the command who to print information
	   # about the users that currently logged in.
	   who
	   echo $enterString
           read DUMMY
           ;;
        3)
	   # Shows the number of users currently logged in
           # by counting the number of lines printed by who.
           echo `who | wc -l`
	   echo $enterString
	   read DUMMY     
           ;;
        4)
	   # Prints out all the users that are using bash shell currently.
	   #grep /bash /etc/passwd | cut -d ":" -f 1 | sort | uniq
	   ps aux | grep bash | grep -v grep | cut -d " " -f 1 | sort | uniq
	   echo $enterString
      	   read DUMMY   
           ;;
        5)
      	   exit
           ;;
    esac
done
