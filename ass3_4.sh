#!/bin/bash

if [ $# -eq 1 ]; #if passing only one file then print the data of that file then 
then
	cat $1 
elif [ $# -eq 2 ]; #if passed two files then copy the contents of file1 into file 2 and print then 
then
	cp $1 $2 
	cat $2 
else #copy the contents of all the files into last files and print 
	touch new 
	for var in $@ 
	do
		cat $var >> new 
	done 
fi
echo "Content of NEW File :- "
awk '{a[i++]= $0 } END {for(j=i-1;j>=0;j--) print a[j];}'
new
#One by one line is read and stored in an array. At the end, the array is printed in the reverse order by starting from the last index.

