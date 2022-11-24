#!/bin/bash

# echo $0 $1 $2 $3 $4 $5 $6

# these are agruments with $0 being the file and $1 to $9 being the other arguments provided

args=("$@") # to give unlimited arguments

echo $@ # prints the array

echo $# # print the length of array 
