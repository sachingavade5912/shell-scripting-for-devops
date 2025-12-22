#!/bin/bash
#This is a for and while loop

<< comment
 $1 is the file name
 $2 is the start of the for loop
 $3 is the end of the for loop
comment


for ((i=$2; i<=$3; i++));
do
	mkdir "test$i"
done
