#!/bin/bash

read -p "Enter number : " num

if (( $num%3==0  && $num%5==0 ))
then
    echo "$num is a multiple of 3 and 5"
elif (( $num%3==0 ))
then 
    echo "$num is a multiple of 3"
elif (( $num%5==0 ))
then 
    echo "$num is a multiple of 5"
else
    echo "$num is not a multiple of 3 or 5"
fi

