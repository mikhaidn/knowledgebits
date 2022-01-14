#!/bin/bash

repoHead="docs"

# for each markdown file found
for file in `ls ${repoHead}/*.md *${repoHead}/*/*.md*`;
do
	echo "|-- $file"
	for reference in `cat $file | grep \(*.md\) | sed  's/.*(\(.*\))/\1/'`
	do
		if ! [ -f ${repoHead}/$reference ] 
		then
			echo "|   |-- $reference"
		fi
	done
        echo
done


