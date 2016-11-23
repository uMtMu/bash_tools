#!/bin/bash

report="report.txt"

rm "$report"

for file in `ls *.rb`
do
    echo "$file" >> "$report"
    sed "s/^[ \t]*//" "$file" | grep "def\|require\|^@.*=" | sed 's/^/\t/g' |sort -r | uniq >> "$report"
    echo -e "\n" >> "$report"
done

