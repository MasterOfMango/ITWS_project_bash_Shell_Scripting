#!/bin/bash

op=$1

if [ "$op" == "write" ]
then
	eno=$2
	ename=$3
	esalary=$4
	echo "$eno,$ename,$esalary" >> employee.txt
	sort -t',' -k 1,1 -k3n employee.txt -o employee.txt
	echo "Done"
fi

if [ "$op" == "read" ]
then
	ser=$2
	sert=$3
	if [ "$ser" == "eno" ]
	then
		sert=`echo $3 | sed 's/^0*//'`
		cat employee.txt | grep "$sert" | while read a
		do
			eno=`echo $a | cut -d',' -f 1`
			eno=`echo $eno | sed 's/^0*//'`
			if [ "$eno" == "$sert" ]
			then
				echo $a
			fi
		done
	fi
	if [ "$ser" == "ename" ]
	then
		cat employee.txt | grep "$sert" | while read a
                do
			ename=`echo $a | cut -d',' -f 2`
                        if [ "$ename" == "$sert" ]
			then
				echo $a
                        fi
                done
        fi
	if [ "$ser" == "esalary" ]
        then
		cat employee.txt | grep "$sert" | while read a
                do
                        esalary=`echo $a | cut -d',' -f 3`
                        if [ "$esalary" == "$sert" ]
			then
                                echo $a
                        fi
                done
        fi
fi

if [ "$op" == "update" ]
then
	for a in `cat employee.txt | grep "$2"` 
	do
                ser=`echo $a | cut -d',' -f 1`
		if [ "$ser" == "$2" ]
		then
			count=$((count + 1))
		fi
	done
	sed -i "/^$2/ d" employee.txt
	eno=$2
	ename=$3
	esalary=$4
	for ((i = 0; i < count; i++))
	do
		echo "$eno,$ename,$esalary" >> employee.txt
	done
	sort -t',' -k 1,1 -k3n employee.txt -o employee.txt
	echo "Done"
fi

if [ "$op" == "delete" ]
then
	sed -i "/^$2/ d" employee.txt
	echo "Done"
fi

if [ "$op" == "duplicate" ]
then
	cat employee.txt | uniq -d
fi

if [ "$op" == "nthsalary" ]
then
	sal=$2
	esal=`cat employee.txt | tr ',' ' ' | cut -d' ' -f 3 | uniq | sort -bnr | head -${sal} | tail -1`
	cat employee.txt | grep "$esal" | while read a
	do
		pre=`echo $a | cut -d',' -f 3`
		if [ "$esal" == "$pre" ]
		then
			echo $a
		fi
	done
fi
