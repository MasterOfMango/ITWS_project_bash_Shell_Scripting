#!/bin/bash

crontab $1 > /dev/null 2>&1
is_valid=$?
if ((is_valid == 0)); then
	echo "Yes"
else
	echo "No"
fi
