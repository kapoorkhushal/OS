#!/bin/bash
directory="NEW_DIRECTORY"
command=$(find . -type f -size 0 | cut -d "/" -f2;)
# Check if any files having size 0 exists?
if [[ $command ]]; then
# Files having size 0 bytes exists
	if [ -d "$directory" ]; then
		echo "Found directory $directory"
		for i in $command; do
			mv $i $directory && echo "moved $i to $directory/$i"
		done
	else
		echo "$directory directory do not exist!!" 
		echo "----------------"
		echo "Creating directory...."
		mkdir $directory
		echo "Moving files.."
		for i in $command; do
			mv $i $directory && echo "moved $i to $directory/$i"
		done
	fi
	elif [ $? != 0 ] ; then
		echo "Program Error!"
	else
		echo "No files having file size 0 could be found"
fi

