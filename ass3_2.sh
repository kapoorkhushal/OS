#!/bin/bash 
ls -l>filesize.txt 
awk '{print "File Name = " $9 " "  " || "  " Size = " $5 " "bytes}' filesize.txt 

