#!/bin/bash

cnt=$#
arr=($@)
com="sort -s -n -k${3}"
for ((i = 3; i < cnt; i++))
do
	j=${arr[$i]}
	com=$com" -k${j}"
done
cat $1 $2 | $com
