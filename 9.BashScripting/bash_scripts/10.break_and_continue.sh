#!/bin/bash

for i in {1..10}
do 
	
	if (( $i==3 ))
	then
		continue #or break 
	fi
	echo $i
done
     
