#!/bin/bash

ls +la >& new.txt # this will send both the error and script to new

MESSAGE="WELCOME SHANANA"

export MESSAGE
./import_script.sh
