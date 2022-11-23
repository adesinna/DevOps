#!/bin/bash

for i in {1..100}
do 
    if (( $i%3==0 && $i%5==0 ))
    then
        echo "FizzBuzz $i"
    elif (( $i%3==0 ))
    then
        echo "Fizz $i"
    elif (( $i%5==0 ))
    then
        echo "Buzz $i"
    fi
done

      
