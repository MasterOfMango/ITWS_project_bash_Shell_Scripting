#!/bin/bash

read a
rev=`echo $a | awk '{print tolower($a)}' | rev`
or=`echo $rev | rev`
if [[ "$or" == "$rev" ]]
then
	echo "Yes"
else
	echo "No"
fi
