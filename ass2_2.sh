#!/bin/bash
date=$(date +%F)
date="backup-$date"
echo "Creating Directory"
mkdir ../$date
find -mmin -60 | grep -e "./" | while read -r line ;do
echo "Processing $line"
cp $line ../$date -rf
done
