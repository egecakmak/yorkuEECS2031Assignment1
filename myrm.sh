#!/bin/bash
# Define and create the recycle directory.
recycleDir=/tmp/cakmake/eecs2031m/a1/recycle-bin
mkdir -p $recycleDir

# Display an error message and instructions if no arguments are given.
if [ $# -eq "0" ]
    then
        echo 'Error:no target specified'
        echo 'Usage:./myrm <files>'
        exit
fi

# Move the files given in the arguments to recycleDir.
# If a file with the same name already exists in recycleDir,
# both files will be preserved and the new one will be renamed as copy.
# Example : In the recycleDir: aa bb
#           recycleDir after user deletes aa: aa aacopy1 bb
#	    recycleDir after user deletes aa again: aa aacopy1 aacopy2 bb
for argument in "$@"
do
    # Check if the file exists.
    if [ -f $argument ]
        then	
		# If the file exists then a display a 
		# message saying it is being deleted.
                echo 'deleting' $argument
		# Define suffix as 1.		
		let suffix=1
		# Get the file name from the variable argument
		# incase user species the file including it's 
		# directory.
		filename=`basename $argument`
		# Define a variable finished so we can get 
		#out of the loop below when we are done.		
		finished=0
		# Check if a file with the same name exist in the recycleBin.
		# If yes, find a suitable name for the one user is trying to delete.		
		if [ -f $recycleDir/$filename ] 
			then    
				# Check if copies with the same name exist.      
				while [ $finished -eq "0" ]
				do
					if [ -f ${recycleDir}/${filename}'copy'$suffix ]
						then
							suffix=`expr $suffix + 1`
						else
							# Move the file to the recycling bin with the name found above.
							# Get out of the loop.
							mv $argument ${recycleDir}/${filename}'copy'${suffix}
							finished=1
							
					fi 		
				done

			else
				# Move the file to the recycle bin.
				mv $argument $recycleDir			
		fi

        else
		# Display a warning if a file user is trying to delete doesn't exist.
                echo "File" $argument "does not exist"
    fi
done



