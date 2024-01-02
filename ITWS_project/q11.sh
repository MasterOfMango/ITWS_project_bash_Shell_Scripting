#!/bin/bash

read op
read n
read a
read b
res=$(echo "$a$op$b" | bc -l)
for ((i = 2; i < n; i++))
do
	read p
	res=$(echo "$res$op$p" | bc -l)
done

ch=$(echo "$res*10000" | bc)
che=`echo $ch | cut -d'.' -f 1`
if [ "$op" == "/" ] || [ "$op" == "*" ]
then
	if ((che%10000 == 0))
	then
		printf "%d" "$res"
	else
		printf "%.4f" "$res"
	fi
else
	printf "%d" "$res"
fi
echo
