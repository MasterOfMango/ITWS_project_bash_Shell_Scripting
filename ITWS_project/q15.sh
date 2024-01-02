#!/bin/bash

echo "$1" > q15_url.txt
echo "$2" >> q15_url.txt
wget -qO- $1 > $3
wget -qO- $2 >> $3
cat ${3} | grep -oP '(?<=>).*?(?=<)' | tr '[:punct:]' ' ' | tr -s ' ' | tr '[:space:]' '[\n*]' | sed 's/[^0-9a-zA-Z]//g' | sed '/^\s*$/d' | sort | uniq -c | awk '{t = $1; $1 = $2; $2 = t; print;}' > ${3}
sort -k2nr -k1 $3 -o $3
