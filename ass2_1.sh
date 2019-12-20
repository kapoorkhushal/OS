#!/bin/bash

if [[ $1 ]]; then # any thing other than Zero
	cd $1 && find $PWD -type f
else
	echo "Invalid Path Entered"
	echo "Usage: ./filename path"
fi

