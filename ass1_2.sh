#!/bin/bash

n=1
for file in *.cpp
do
	mv "$file" "${file%.cpp}.c"
	(( n++ ))
done
echo "Number of renamed files are $n"

