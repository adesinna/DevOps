#!/usr/bin/python3

import os

userlist = ['adesina', 'oluwaseun', 'emmanuel']

for user in userlist:
	exitcode = os.system(f"id {user}")

	if exitcode != 0:
		print("user does not exist")

		os.system(f"useradd {user}")
	else:
		print(f'{user} exist')


