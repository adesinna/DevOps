#!/bin/bash

echo '############################################'
date

ls /var/run/httpd/httpd.pid # get the process id of httpd &> /dev/null

if [ $? -eq 0 ]
then
	echo "httpd is running"
else
	echo "httpd is not running"
	echo "starting the process"
	systemtcl start httpd

	if [ $? -eq 0 ]
	then
		echo "httpd started sucessfully"
	else
		echo "httpd failed
	fi
fi
echo '###########################################'
