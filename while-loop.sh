#!/bin/bash
#This is a while loop

num=0

while [[ $num -le 10 ]]; 
do 
	echo $num
	num=$((num+2))
done
