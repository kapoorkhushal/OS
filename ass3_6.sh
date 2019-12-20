#!/bin/bash
BEGIN{print"Record\t\tCharacters\tWords\n"} 
#BODY section 
{ 
	count=length($0) 
		print("-",NR,":\t\t",count,":\t\t",NF," ",$0) 
		words+=NF 
		Total_count+=count 
}
END{
	print("Total No of lines :\t" NR) 
	print("Total No of words :\t" words) 
	print("Total No of Characters:" Total_count) 
}
