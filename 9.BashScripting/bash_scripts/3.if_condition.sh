#!/bin/bash

counter=10 # no spaces

if (( $counter > 10  )) # leave space on each side of the bracket and $variablename calls the variable
then
    echo "the condition is true"
else
    echo "the condition is false"
fi
