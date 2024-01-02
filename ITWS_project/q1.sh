#!/bin/bash

#flag=0
#echo $1 | while read s
#do
#	p="$(echo "$s" | sed -e 's/./&,/g' -e 's/,$//')"
#	eval "printf "%s\\\\n" "$(eval 'echo "$(printf "{'"$p"'}%.0s" {0..'"$((${#s}-1))"'})"')" | grep '\(.\)\1*.*\1' -v" 
#	while read b
#	do
#		which "$b" > /dev/null 2>&1
#		ifis=$?
#		if ((ifis == 0)); then
#			echo "Yes"
#			echo "$($b --help)"
#			flag=1
#		else
#			continue
#		fi
#		echo
#	done
#done

#echo $1 |{ while read a
#do 
#	crunch ${#a} ${#a} -p "$a" |{ while read b
#	do
#		echo "$($b --help)"
#	done
#	}
#done
#}

perm()
{
	  local items="$1"
          local out="$2"
          local i
	  [[ "$items" == "" ]] && echo "$out" && return
	  for (( i=0; i<${#items}; i++ ))
	  do
	       perm "${items:0:i}${items:i+1}" "$out${items:i:1}"
	  done
}

read a
arr=`perm $a | sort`
for b in `echo ${arr[@]}`
do
	command -v $b > /dev/null 2>&1
	ifis=$?
	if ((ifis == 0)); then
		echo "Yes"
		echo "$b"
		$b --help > /dev/null 2>&1
		ifhel=$?
		if ((ifhel == 0)); then
		        $b --help
		else
			man -P cat $b
		fi
		exit 0
	else
		continue
	fi
done
echo "No"

