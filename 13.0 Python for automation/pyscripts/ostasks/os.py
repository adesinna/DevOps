#!/usr/bin/python3

import os

path = "/tmp/testfile.txt"

if os.path.isdir(path):  # check for directory
	print("It is a directory")

elif os.path.isfile(path):  # check for file
	print("It is a file")

else:
	print("not a file or folder")
