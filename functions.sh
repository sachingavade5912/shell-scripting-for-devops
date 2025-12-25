#!/bin/bash

#This is function definition
function while_loop() {
	while [[ $num -le 10 ]]; 
do 
	echo $num
	num=$((num+2))
done
}

#This is a function call
while_loop
