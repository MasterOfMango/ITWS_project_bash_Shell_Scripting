#!/bin/bash

read p
str=`echo $p | sed 's/)(/ /g' | tr -d '(' | tr -d ')' | tr -s ' '`
tes=`echo $str | awk '{$1 = $1; print}'`
echo "($tes)"
