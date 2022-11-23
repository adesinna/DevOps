#!/bin/bash

echo "welcome to guess game"

echo "guess is between 1 to 10"

echo "input number: "

read guess

answer=5

if (( $guess>answer ))
then
   echo "number is greater than answer"
elif (( $guess<answer ))
then
    echo "number is less than answer"
else
    echo "your are correct"
fi 
