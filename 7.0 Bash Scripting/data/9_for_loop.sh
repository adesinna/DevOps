#!/bin/bash

MYUSERS="adesina shanana oluwaseun emmmanuel"

for usr in $MYUSERS
do
	useradd $usr
	echo "added $usr"
	sleep 3
done


