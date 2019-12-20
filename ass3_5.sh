#!/bin/bash
echo "Content of "city" file :-"
cat city.txt
touch my_city 
for var in $@ 
do
	cat $var >> my_city 
done 
echo "Content of my_city File :- "
awk '{a[i++]= $0 } END {for(j=0;j<i;j++) print " I WOULD LIKE TO VISIT " a[j];}' my_city
#One by one line is read and stored in an array. At the end, the array is printed.

