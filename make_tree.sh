#!/bin/bash

# suggested usage
files=$(sh find_dead_links.sh | grep -v "|-- docs" |grep md | cut -d" " -f5)

first_time=0
for file in $files
do 
	if [[ $first_time -eq 0 ]]
	then

		dir=$(dirname $file)
		base=$(basename $file)
		echo "|-- $dir"	
		echo "|   |-- $base"
		olddir=$dir
		first_time=1
		continue
	fi
	dir=$(dirname $file)
	base=$(basename $file)
	if [ "$olddir" != "$dir" ]
	then
		echo "|"
                echo "|-- $dir"
	fi
	echo "|   |-- $base"
	olddir=$dir
done
