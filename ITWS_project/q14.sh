echo "<!DOCTYPE html>" > q14.html
echo "<html>" >> q14.html
echo "<head>" >> q14.html
echo "<style>" >> q14.html
echo "table {" >> q14.html
echo "	border-collapse: collapse;" >> q14.html
echo " 	border: 2px solid black;" >> q14.html
echo "}" >> q14.html
echo "td {" >> q14.html
echo "	width: 33%" >> q14.html
echo "}" >> q14.html
echo "th {" >> q14.html
echo "	border: 2px solid black;" >> q14.html
echo "	width: 33%" >> q14.html
echo "}" >> q14.html
echo "</style>" >> q14.html
echo "</head>" >> q14.html
echo "<body>" >> q14.html

echo "<table border=\"1\">" >> q14.html
home=`echo ~`
for i in `find ~ -not -path '*/\.*' -type d`
do
	if [ "$i" == "$home" ]; then
		dir="Home Directory"
	else
		dir=`echo ${i#$home/}`
	fi
	echo "<tr>" >> q14.html
	echo "	<th colspan=\"3\" style=\"text-align:center\">$dir</th>" >> q14.html
	echo "</tr>" >> q14.html
	if [ "$(ls -A $i)" ]; then
		echo "<tr>" >> q14.html
		echo "	<th>Name</th>" >> q14.html
		echo "	<th>Size</th>" >> q14.html
		echo "	<th>File/Dir</th>" >> q14.html
		echo "</tr>" >> q14.html
		find $i -maxdepth 1 -not -path '*/\.*' | while read a
		do
			if [ "$a" != "$i" ]; then
			    chk=`basename "$a"`
			    size=`du -h $a | tail -1 | awk '{print $1;}'`
			    if [ -d $a ]; then
				    typ="Dir"
			    elif [ -f $a ]; then
				    typ="File"
			    fi
			    echo "<tr>" >> q14.html
			    echo "	<td>$chk</td>" >> q14.html
			    echo "	<td>$size</td>" >> q14.html
			    echo "	<td>$typ</td>" >> q14.html
			    echo "</tr>" >> q14.html
			else
				continue
			fi
		done
	else
		echo "<tr>" >> q14.html
		echo "	<td colspan=\"3\" style=\"text-align:center\">(Empty)</td>" >> q14.html
		echo "</tr>" >> q14.html
	fi
done
echo "</table>" >> q14.html

echo "</body>" >> q14.html
echo "</html>" >> q14.html
firefox q14.html &
