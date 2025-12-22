#!/bin/bash

read -p "Please enter the car name: " carname

if [[  $carname == "exter"  ]];
then
	echo "You guessed it correct!"

elif [[ $carname == "Exter" ]]; then
	echo "You guessed it correct!"

else 
	echo "Better luck next time!!"
fi
