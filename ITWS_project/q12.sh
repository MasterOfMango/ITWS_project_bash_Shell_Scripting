#!/bin/bash

read a
dat=`echo $a | tr ',' ' ' | tr -s ' '`
date -d "$dat" > /dev/null  2>&1
is_valid=$?
if ((is_valid == 0)); then
	date -d "$dat" +%m/%d/%Y
	date -d "$dat" +%d-%m-%Y
else
	echo "Invalid"
fi
