#!/bin/bash

arr=("$@")
len=${#arr[@]}

p=1
for ((i = 1; i < len; i++))
do
	p=$((p*arr[i]))
done

pow=$(echo "${arr[0]}^$p" | bc)
echo $pow
