#!/bin/bash

echo "Enter number"
# To get user input we use read
read x
count=10

if (( $x >10  ))
then
    echo "$x is greater than 10  " 
else
    echo "$x is less than 10"
fi
