#!/bin/bash

read -p 'Enter number: ' NUM

echo $NUM

if [ $NUM -gt 100 ]
then
	echo "This number $NUM is greater the 100"
else
	echo "This number $NUM is less than or equal to 100"
fi
