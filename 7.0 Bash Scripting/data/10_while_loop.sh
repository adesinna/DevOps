#!/bin/bash

counter=0

while [ $counter -le 5 ]
do
	echo $counter
	((counter=counter+1))
done
