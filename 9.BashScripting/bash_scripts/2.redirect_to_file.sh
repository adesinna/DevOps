#!/bin/bash
# This will put the output in file.txt 

echo "Adesina will be great" > file.txt

cat >> file.txt # this will append the text on the terminal to the file, if you use > it will replace the text instead
: '
this
is 
commented'

cat << liverpool
This text will show when you run the bash script
liverpool
