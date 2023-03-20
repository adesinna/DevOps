#!/bin/bash

VALUE=$(ip addr show | grep -v LOOPBACK | grep -ic mtu) 
# get ip addr, ignore loopback line, count mtu

if [ $VALUE -eq 1 ]
then
	echo "1 Active Network Interface found"
elif [ $VALUE -gt 1 ]
then
	echo "Multiple Active Network Interface found"
else
	echo "No Active Network Interface found"
fi
